import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/utils/style/themes.dart';
import 'package:sferius_ai/core/utils/ui_needs/app_svg.dart';
import 'package:sferius_ai/core/widgets/custom_loader.dart';
import 'package:sferius_ai/features/sfereius/domain/entities/chat_entity.dart';
import 'package:sferius_ai/features/sfereius/domain/entities/message_entity.dart';
import 'package:sferius_ai/features/sfereius/presentation/blocs/chat_bloc.dart';
import 'package:sferius_ai/features/sfereius/presentation/widgets/assistant_message_container.dart';
import 'package:sferius_ai/features/sfereius/presentation/widgets/menu_widget.dart';
import 'package:sferius_ai/features/sfereius/presentation/widgets/sferius_chat_app_bar.dart';
import 'package:sferius_ai/features/sfereius/presentation/widgets/typing_indicator.dart';
import 'package:sferius_ai/features/sfereius/presentation/widgets/user_message_container.dart';
import 'package:sferius_ai/generated/l10n.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ChatScreen extends StatefulWidget {
  final ChatEntity? chat;
  final String? defaultChat;

  const ChatScreen({super.key, this.chat, this.defaultChat});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late List<MessageEntity> allMessages;
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final ValueNotifier<String> iconAddressNotifier = ValueNotifier<String>(
    AppSvg.send,
  );

  Timer? _messageTimer;
  int _lastMessageCount = 0;
  bool isReceivingMessages = false; // 🚨 NEW: Prevent sending when true

  @override
  void initState() {
    super.initState();

    context.read<ChatBloc>().add(ChatEvent.clearMessages());

    if (widget.defaultChat != null) {
      context.read<ChatBloc>().add(
        ChatEvent.sendMessage(widget.defaultChat!, null),
      );
    }

    // 🔹 Listen for focus changes to prevent unnecessary loss of focus
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        debugPrint("TextField Focused ✅");
      } else {
        debugPrint("TextField Unfocused ❌");
      }
    });

    if (widget.chat != null) {
      context.read<ChatBloc>().add(ChatEvent.joinChat(widget.chat!.id));
      context.read<ChatBloc>().add(
        ChatEvent.getMessagesByChatId(widget.chat!.id),
      );
    }
  }

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    iconAddressNotifier.dispose();
    _messageTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        context.read<ChatBloc>().add(ChatEvent.closeChannel());

        return;
      },
      child: Scaffold(
        backgroundColor:
            Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size(393.w, 56.w),
          child: SferiusChatAppBar(
            title:
                widget.chat == null
                    ? S.of(context).new_chat
                    : widget.chat!.title,
            iconAddress: AppSvg.menu,
            onTap: () {
              showModalBottomSheet(
                context: context,
                barrierColor: Colors.black.withOpacity(0.5),
                backgroundColor: Colors.transparent,
                builder: (context) => MenuWidget(),
              );
            },
          ),
        ),
        body: BlocListener<ChatBloc, ChatState>(
          listenWhen: (previous, current) {
            return previous.messageEntities != current.messageEntities ||
                previous.typingMessage != current.typingMessage;
          },
          listener: (context, state) {
            // If assistant is typing, disable sending
            if (state.typingMessage.isNotEmpty) {
              if (!isReceivingMessages) {
                setState(() => isReceivingMessages = true);
              }
              _resetMessageTimer(); // Restart timer for inactivity
            } else if (state.typingMessage.isEmpty &&
                isReceivingMessages &&
                _messageTimer == null) {
              // Fallback: no typing and no timer running
              _resetMessageTimer();
            }

            _lastMessageCount = state.messageEntities.length;
          },
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ChatBloc, ChatState>(
                  // buildWhen: (previous, current) {
                  //   // 🔹 Prevent rebuilding if only the input changes
                  //   return previous.messageEntities != current.messageEntities ||
                  //       previous.status != current.status;
                  // },
                  builder: (context, state) {
                    allMessages = List.from(state.messageEntities);

                    return ListView.builder(
                      reverse: true, // Latest message at the bottom
                      padding: EdgeInsets.all(16.w),
                      itemCount:
                          state.messageEntities.length +
                          (state.typingMessage.isNotEmpty ? 1 : 0),
                      itemBuilder: (context, index) {
                        // Typing dots (loading animation) when there's no visible message yet
                        if (index == 0) {
                          if (state.typingMessage.isNotEmpty) {
                            return AssistantMessageContainer(
                              message: state.typingMessage,
                            );
                          } else if (isReceivingMessages) {
                            return const TypingIndicator();
                          }
                        }

                        // Display existing messages
                        final message =
                            state.messageEntities[(state
                                        .typingMessage
                                        .isNotEmpty ||
                                    isReceivingMessages)
                                ? index - 1
                                : index];

                        return message.role == 'user'
                            ? UserMessageContainer(message: message.content)
                            : AssistantMessageContainer(
                              message: message.content,
                            );
                      },
                    );
                  },
                ),
              ),
              _buildMessageInput(),
            ],
          ),
        ),
      ),
    );
  }

  void _resetMessageTimer() {
    _messageTimer?.cancel();
    _messageTimer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          isReceivingMessages = false;
        });
      }
      _messageTimer = null;
      debugPrint("Assistant finished typing. Input re-enabled.");
    });
  }

  void _handleMessageEnd(void Function(VoidCallback) setState) {
    isReceivingMessages = false; // ✅ Enable sending
    setState(() {});
    debugPrint("Ready to send a new message.");
  }

  Widget _buildMessageInput() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color:
            Theme.of(context).brightness == Brightness.dark
                ? AppColors.c1C1C1E
                : Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 150.w),
              child: TextFormField(
                enabled: !isReceivingMessages, // Disable input when loading
                focusNode: focusNode,
                controller: textController,
                onChanged: (value) {
                  iconAddressNotifier.value =
                      value.isNotEmpty ? AppSvg.send : AppSvg.send;
                },
                maxLines: null,
                minLines: 1,
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Write something...',
                  hintStyle: AppTextStyles.sf15grey400,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          ValueListenableBuilder<String>(
            valueListenable: iconAddressNotifier,
            builder: (context, iconAddress, _) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap:
                    isReceivingMessages
                        ? null
                        : () {
                          if (textController.text.trim().isNotEmpty) {
                            final userMessage = textController.text;

                            allMessages.add(
                              MessageEntity(role: 'user', content: userMessage),
                            );

                            context.read<ChatBloc>().add(
                              ChatEvent.sendMessage(
                                userMessage,
                                widget.chat?.id,
                              ),
                            );

                            textController.clear();
                            // focusNode.requestFocus(); // Keep focus on input
                            iconAddressNotifier.value = AppSvg.send;
                          }
                        },
                child: CircleAvatar(
                  backgroundColor:
                      isReceivingMessages ? Colors.transparent : Colors.black,
                  radius: 24.w,
                  child:
                      isReceivingMessages
                          ? Container(
                            padding: EdgeInsets.all(10),
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          )
                          : SvgPicture.asset(iconAddress),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
