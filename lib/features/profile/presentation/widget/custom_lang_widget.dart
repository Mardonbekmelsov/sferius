// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/features/profile/presentation/widget/circle_check_box_widget.dart';

class CustomLangWidget extends StatefulWidget {
  final String code;
  final String lang;
  final void Function(bool) onChanged;
  const CustomLangWidget({
    super.key,
    required this.code,
    required this.lang,
    required this.onChanged,
  });

  @override
  State<CustomLangWidget> createState() => _CustomLangWidgetState();
}

class _CustomLangWidgetState extends State<CustomLangWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              EdgeInsets.only(top: 2.h, bottom: 2.h, left: 2.w, right: 20.w),
          width: double.infinity,
          height: 60.h,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.c2C2C2E
                : AppColors.white,
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Row(
            children: [
              Container(
                width: 64.w,
                height: 64.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.c3C3C3E
                      : AppColors.cF5F6F7,
                ),
                child: Image.asset(
                  width: 18.w,
                  height: 12.h,
                  'assets/flags/${widget.code}_dark.gif',
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Text(
                widget.lang,
                style: TextStyle(
                    fontSize: 17.sp,
                    letterSpacing: -1.5,
                    fontFamily: 'SF Pro Display'),
              ),
              const Spacer(),
              CircularCheckbox(
                  value: Localizations.localeOf(context).languageCode ==
                      widget.code,
                  onChanged: widget.onChanged),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        )
      ],
    );
  }
}
