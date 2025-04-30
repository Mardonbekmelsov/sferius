import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sferius_ai/core/blocs/chat_text_size_cubit.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/utils/style/themes.dart';

class UserMessageContainer extends StatelessWidget {
  const UserMessageContainer({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatTextSizeCubit, double>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              // 🔹 Prevents overflow
              child: Container(
                margin: EdgeInsets.only(left: 40, top: 4, bottom: 4),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                constraints: BoxConstraints(
                  maxWidth:
                      MediaQuery.of(context).size.width *
                      0.75, // 🔹 Limits width
                ),

                child: Text(
                  message,
                  style: AppTextStyles.sf15black400.copyWith(
                    fontSize: state,
                    color:
                        Theme.of(context).brightness == Brightness.light
                            ? AppColors.c3C3C3C99.withOpacity(0.6)
                            : AppColors.cEBEBEB99.withOpacity(0.6),
                  ),
                  softWrap: true, // 🔹 Ensures text wraps properly
                  overflow: TextOverflow.visible, // 🔹 Prevents clipping
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
