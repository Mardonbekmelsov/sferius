// ignore_for_file: deprecated_member_use

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/localization/cubit/localization_cubit.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/utils/style/themes.dart';
import 'package:sferius_ai/features/profile/presentation/widget/custom_lang_widget.dart';

import 'package:svg_flutter/svg.dart';

class BottomSheetLangWidget extends StatefulWidget {
  const BottomSheetLangWidget({super.key});

  @override
  State<BottomSheetLangWidget> createState() => _BottomSheetLangWidgetState();
}

class _BottomSheetLangWidgetState extends State<BottomSheetLangWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior:
          Clip.none, // Allows SVG to overflow outside the bottom sheet
      children: [
        // SVG Positioned ABOVE the bottom sheet
        Positioned(
          top: -36.h, // Move upwards
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            'assets/svg/background2.svg', // Change to your preferred SVG
            width: double.infinity,
            height: 60.h, // Adjust as needed
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.c1C1C1E
                : AppColors.backgroundColor,
          ),
        ),

        // Bottom Sheet Container
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.c1C1C1E
                : AppColors.backgroundColor,
          ),
          height: 320.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Выберите язык',
                style: Theme.of(context).brightness == Brightness.dark
                    ? AppTextStyles.sf20white400
                    : AppTextStyles.sf20black400,
              ),
              SizedBox(height: 14.h),
              CustomLangWidget(
                code: 'ru',
                lang: 'Русский',
                onChanged: (p0) {
                  setState(() {
                    context.read<LocaleCubit>().setLocale(const Locale('ru'));
                  });
                  Navigator.pop(context);
                },
              ),
              CustomLangWidget(
                code: 'uz',
                lang: 'Узбекский',
                onChanged: (p0) {
                  setState(() {
                    context.read<LocaleCubit>().setLocale(const Locale('uz'));
                  });
                  Navigator.pop(context);
                },
              ),
              CustomLangWidget(
                code: 'en',
                lang: 'Английский',
                onChanged: (p0) {
                  setState(() {
                    context.read<LocaleCubit>().setLocale(const Locale('en'));
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
