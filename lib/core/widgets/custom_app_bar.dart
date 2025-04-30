// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/utils/ui_needs/app_svg.dart';
import 'package:svg_flutter/svg_flutter.dart';

AppBar customAppBar({
  required BuildContext context,
  required VoidCallback onTapCloseOrAccount,
  required String title,
  required bool isAccountIcon,
  required bool hasFilterIcon,
}) {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Theme.of(context).brightness == Brightness.dark
        ? AppColors.c1C1C1E
        : AppColors.white,
    automaticallyImplyLeading: false,
    centerTitle: false,
    title: Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(title,
          style: TextStyle(
            fontSize: 36.sp,
            letterSpacing: -1.5.sp,
            height: 44.h,
          )),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 8.w, bottom: 8.h),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTapCloseOrAccount,
          child: CircleAvatar(
            radius: 22.r,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? AppColors.c2C2C2E
                : AppColors.cF8F8F8,
            child: hasFilterIcon
                ? SvgPicture.asset(
                    AppSvg.filter,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.cFEFEFE
                        : AppColors.black,
                  )
                : isAccountIcon
                    ? SvgPicture.asset(
                        AppSvg.account,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.cFEFEFE
                            : AppColors.black,
                      )
                    : SvgPicture.asset(
                        AppSvg.close,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.cFEFEFE
                            : AppColors.black,
                      ),
          ),
        ),
      ),
    ],
  );
}
