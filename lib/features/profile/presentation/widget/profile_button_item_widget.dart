import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/utils/ui_needs/app_svg.dart';
import 'package:svg_flutter/svg.dart';

class ProfileButtonItemWidget extends StatelessWidget {
  final String title;
  final String appSvg;
  final VoidCallback onTap;

  const ProfileButtonItemWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.appSvg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.c1C1C1E
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
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.c2C2C2E
                    : AppColors.black,
                child: SvgPicture.asset(
                  appSvg,
                  height: 18.h,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              SizedBox(width: 10.w),
              SizedBox(
                width: 220.w,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        letterSpacing: -0.5.sp,
                        fontSize: 17.sp,
                      ),
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                AppSvg.arrowEnter,
                height: 10.h,
                width: 6.w,
              ),
              SizedBox(width: 16.w),
            ],
          ),
        ),
      ),
    );
  }
}
