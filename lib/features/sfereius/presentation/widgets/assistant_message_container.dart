// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gpt_markdown/gpt_markdown.dart';
// import 'package:sferius_ai/core/blocs/chat_text_size_cubit.dart';
// import 'package:sferius_ai/core/constants/app_constants.dart';
// import 'package:sferius_ai/core/utils/style/colors.dart';
// import 'package:sferius_ai/core/utils/style/themes.dart';

// class AssistantMessageContainer extends StatefulWidget {
//   final String message;

//   const AssistantMessageContainer({super.key, required this.message});

//   @override
//   State<AssistantMessageContainer> createState() =>
//       _AssistantMessageContainerState();
// }

// class _AssistantMessageContainerState extends State<AssistantMessageContainer> {
//   Timer? _typingTimer;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _typingTimer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ChatTextSizeCubit, double>(
//       builder: (context, state) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Flexible(
//               child: Container(
//                 margin: const EdgeInsets.only(right: 20, top: 4, bottom: 4),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 10,
//                 ),
//                 child: GptMarkdown(
//                   widget.message,
//                   style: AppTextStyles.sf15white400.copyWith(
//                     fontSize: state,
//                     color:
//                         Theme.of(context).brightness == Brightness.dark
//                             ? AppColors.white
//                             : AppColors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:sferius_ai/core/blocs/chat_text_size_cubit.dart';
import 'package:sferius_ai/core/constants/app_constants.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/utils/style/themes.dart';
import 'package:sferius_ai/generated/l10n.dart';

class AssistantMessageContainer extends StatefulWidget {
  final String message;

  const AssistantMessageContainer({super.key, required this.message});

  @override
  State<AssistantMessageContainer> createState() =>
      _AssistantMessageContainerState();
}

class _AssistantMessageContainerState extends State<AssistantMessageContainer> {
  Timer? _typingTimer;

  @override
  void dispose() {
    _typingTimer?.cancel();
    super.dispose();
  }

  void _showFeedbackMessage() {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: MediaQuery.of(context).size.width * 0.2,
            right: MediaQuery.of(context).size.width * 0.2,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(10),
              color: Colors.green.shade600,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Center(
                  child: Text(
                    S.of(context).thanks_feedback,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () => overlayEntry.remove());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatTextSizeCubit, double>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(right: 20, top: 4, bottom: 4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    child: GptMarkdown(
                      widget.message,
                      style: AppTextStyles.sf15white400.copyWith(
                        fontSize: state,
                        color:
                            Theme.of(context).brightness == Brightness.dark
                                ? AppColors.white
                                : AppColors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 4),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.thumb_up_alt_outlined,
                      size: 20,
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? AppColors.white
                              : AppColors.black,
                    ),
                    onPressed: _showFeedbackMessage,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.thumb_down_alt_outlined,
                      size: 20,
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? AppColors.white
                              : AppColors.black,
                    ),
                    onPressed: _showFeedbackMessage,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
