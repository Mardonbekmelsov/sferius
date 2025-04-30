import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:svg_flutter/svg.dart';

class ConfidentialityItemWidget extends StatelessWidget {
  final String title;
  final String appSvg;
  final ValueChanged<bool> onChanged;
  final bool isCheck;
  const ConfidentialityItemWidget({
    super.key,
    required this.title,
    required this.onChanged,
    required this.appSvg,
    required this.isCheck,
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
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 17.sp,
                ),
          ),
          const Spacer(),
          CupertinoSwitch(
              // This bool value toggles the switch.
              value: isCheck,
              activeTrackColor: AppColors.c34C759,
              onChanged: onChanged),
          SizedBox(width: 16.w),
        ],
      ),
    );
  }
}
