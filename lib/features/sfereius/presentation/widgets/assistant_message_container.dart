import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:sferius_ai/core/blocs/chat_text_size_cubit.dart';
import 'package:sferius_ai/core/constants/app_constants.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/utils/style/themes.dart';

class AssistantMessageContainer extends StatefulWidget {
  final String message;
  final bool animate;

  const AssistantMessageContainer({
    super.key,
    required this.message,
    this.animate = false, // Add this flag to enable/disable animation
  });

  @override
  State<AssistantMessageContainer> createState() => _AssistantMessageContainerState();
}

class _AssistantMessageContainerState extends State<AssistantMessageContainer> {
  String _visibleText = '';
  int _charIndex = 0;
  Timer? _typingTimer;

  @override
  void initState() {
    super.initState();

    if (widget.animate) {
      _startTypingAnimation();
    } else {
      _visibleText = widget.message;
    }
  }

  void _startTypingAnimation() {
    _typingTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (_charIndex < widget.message.length) {
        setState(() {
          _visibleText += widget.message[_charIndex];
          _charIndex++;
        });
      } else {
        _typingTimer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _typingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatTextSizeCubit, double>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(right: 20, top: 4, bottom: 4),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: GptMarkdown(
                  _visibleText,
                  style: AppTextStyles.sf15white400.copyWith(
                    fontSize: state,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
