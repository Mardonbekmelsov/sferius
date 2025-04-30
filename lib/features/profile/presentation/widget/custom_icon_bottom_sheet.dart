// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/style/colors.dart';

class CustomIconBottomSheet extends StatelessWidget {
  const CustomIconBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: width * 0.25,
          height: height * 0.018,
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: AppColors.c141414.withOpacity(0.4)),
          ),
        ),
        Positioned(
          top: 0,
          child: SizedBox(
            width: width * 0.16,
            height: height * 0.009,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
