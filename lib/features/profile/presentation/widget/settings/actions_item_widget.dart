import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/utils/app_colors.dart';
import 'package:svg_flutter/svg.dart';

class ActionsItemWidget extends StatelessWidget {
  final String title;
  final String appSvg;
  final VoidCallback onTap;
  final bool isTitleRed;

  const ActionsItemWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.appSvg,
    required this.isTitleRed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.c2C2C2E
            : AppColors.white,
      ),
      child: Material(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.h,
                backgroundColor: AppColors.cFF3B30,
                child: SvgPicture.asset(
                  appSvg,
                  height: 18.h,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 17.sp, color: AppColors.cFF3B30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
