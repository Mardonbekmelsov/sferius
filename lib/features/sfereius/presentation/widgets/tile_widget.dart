// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/utils/style/themes.dart';
import 'package:sferius_ai/core/utils/ui_needs/app_svg.dart';
import 'package:sferius_ai/generated/l10n.dart';
import 'package:svg_flutter/svg_flutter.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({
    super.key,
    required this.iconAddress,
    required this.title,
    required this.hasEntericon,
  });

  final String iconAddress;
  final String title;
  final bool hasEntericon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (title == S.of(context).all_chats) {
          context.pushNamed('all_chats');
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 4),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color:
              Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : AppColors.c2C2C2E,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26.r,
              backgroundColor:
                  Theme.of(context).brightness == Brightness.dark
                      ? AppColors.c3C3C3E
                      : AppColors.cF8F8F8,
              child: SvgPicture.asset(
                iconAddress,
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? AppColors.white
                        : AppColors.c2C2C2E,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style:
                    Theme.of(context).brightness == Brightness.dark
                        ? AppTextStyles.sf16white400
                        : AppTextStyles.sf16black400,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            hasEntericon
                ? Padding(
                  padding: const EdgeInsets.all(14),
                  child: SvgPicture.asset(
                    AppSvg.arrowEnter,
                    height: 10.w,
                    width: 6.w,
                    color: Colors.grey,
                  ),
                )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
