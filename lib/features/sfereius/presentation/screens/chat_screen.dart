import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/utils/style/themes.dart';
import 'package:sferius_ai/core/utils/ui_needs/app_svg.dart';
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
  final ValueNotifier<bool> isReceivingMessagesNotifier = ValueNotifier(false);

  Timer? _messageTimer;
  int _lastMessageCount = 0;

  @override
  void initState() {
    super.initState();

    context.read<ChatBloc>().add(ChatEvent.clearMessages());

    if (widget.defaultChat != null) {
      context.read<ChatBloc>().add(
        ChatEvent.sendMessage(widget.defaultChat!, null),
      );
    }

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
    isReceivingMessagesNotifier.dispose();
    _messageTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: PopScope(
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
              if (state.typingMessage.isNotEmpty) {
                if (!isReceivingMessagesNotifier.value) {
                  isReceivingMessagesNotifier.value = true;
                }
                _resetMessageTimer();
              } else if (state.typingMessage.isEmpty &&
                  isReceivingMessagesNotifier.value &&
                  _messageTimer == null) {
                _resetMessageTimer();
              }

              _lastMessageCount = state.messageEntities.length;
            },
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<ChatBloc, ChatState>(
                    builder: (context, state) {
                      allMessages = List.from(state.messageEntities);

                      return ListView.builder(
                        reverse: true,
                        padding: REdgeInsets.all(8),
                        itemCount:
                            state.messageEntities.length +
                            (state.typingMessage.isNotEmpty ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            if (state.typingMessage.isNotEmpty) {
                              return AssistantMessageContainer(
                                message: state.typingMessage,
                              );
                            } else if (isReceivingMessagesNotifier.value) {
                              return const TypingIndicator();
                            }
                          }

                          final message =
                              state.messageEntities[(state
                                          .typingMessage
                                          .isNotEmpty ||
                                      isReceivingMessagesNotifier.value)
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
      ),
    );
  }

  void _resetMessageTimer() {
    _messageTimer?.cancel();
    _messageTimer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        isReceivingMessagesNotifier.value = false;
      }
      _messageTimer = null;
      debugPrint("Assistant finished typing. Input re-enabled.");
    });
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
            child: ValueListenableBuilder<bool>(
              valueListenable: isReceivingMessagesNotifier,
              builder: (context, isReceivingMessages, _) {
                return ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 150.w),
                  child: TextFormField(
                    key: const ValueKey("chat_input_field"),
                    enabled: !isReceivingMessages,
                    focusNode: focusNode,
                    controller: textController,
                    onChanged: (value) {
                      iconAddressNotifier.value = AppSvg.send;
                    },
                    maxLines: null,
                    minLines: 1,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Write something...',
                      hintStyle: AppTextStyles.sf15grey400,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          ValueListenableBuilder2<String, bool>(
            first: iconAddressNotifier,
            second: isReceivingMessagesNotifier,
            builder: (context, iconAddress, isReceivingMessages, _) {
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
                            iconAddressNotifier.value = AppSvg.send;
                          }
                        },
                child: CircleAvatar(
                  backgroundColor:
                      isReceivingMessages ? Colors.transparent : Colors.black,
                  radius: 24.w,
                  child:
                      isReceivingMessages
                          ? const Padding(
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

// Helper widget for listening to two ValueNotifiers at once
class ValueListenableBuilder2<A, B> extends StatelessWidget {
  final ValueListenable<A> first;
  final ValueListenable<B> second;
  final Widget Function(BuildContext, A, B, Widget?) builder;

  const ValueListenableBuilder2({
    super.key,
    required this.first,
    required this.second,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
      valueListenable: first,
      builder: (context, a, _) {
        return ValueListenableBuilder<B>(
          valueListenable: second,
          builder: (context, b, child) {
            return builder(context, a, b, child);
          },
        );
      },
    );
  }
}
