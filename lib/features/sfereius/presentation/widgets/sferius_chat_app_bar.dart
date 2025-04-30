// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/utils/style/themes.dart';
import 'package:sferius_ai/core/utils/ui_needs/app_svg.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SferiusChatAppBar extends StatelessWidget {
  const SferiusChatAppBar({
    super.key,
    required this.title,
    required this.iconAddress,
    required this.onTap,
  });

  final String title;
  final String iconAddress;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      leadingWidth: 75,
      // flexibleSpace: ,
      centerTitle: true,
      backgroundColor:
          Theme.of(context).brightness == Brightness.dark
              ? AppColors.c1C1C1E
              : Colors.white,
      title: Text(
        title,
        style:
            Theme.of(context).brightness == Brightness.light
                ? AppTextStyles.sf20black500
                : AppTextStyles.sf20white500,
      ),
      leading: MaterialButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: CircleAvatar(
          radius: 22.w,
          backgroundColor:
              Theme.of(context).brightness == Brightness.dark
                  ? AppColors.c2C2C2E
                  : AppColors.cF8F8F8,
          child: SvgPicture.asset(
            height: 14.sp,
            width: 9.sp,
            AppSvg.arrow,
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
          ),
        ),
      ),
      actions: [
        Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              radius: 22.w,
              backgroundColor:
                  Theme.of(context).brightness == Brightness.dark
                      ? AppColors.c2C2C2E
                      : AppColors.cF8F8F8,
              child: SvgPicture.asset(
                iconAddress,
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
