// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/utils/ui_needs/app_svg.dart';
import 'package:svg_flutter/svg.dart';

class AccountManagementItemWidget extends StatelessWidget {
  final String title;
  final String image;
  final String phoneNumber;
  final VoidCallback onTap;

  const AccountManagementItemWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.phoneNumber,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.only(
        bottom: 10.h,
        right: 10.w,
        left: 10.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: AppColors.backgroundColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: onTap,
          
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.h,
                backgroundColor: AppColors.c141414,
                backgroundImage: AssetImage(image),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 17.sp,
                        ),
                  ),
                  Text(
                    phoneNumber,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 13.sp,
                        color: AppColors.c141414.withOpacity(0.4)),
                  ),
                ],
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
