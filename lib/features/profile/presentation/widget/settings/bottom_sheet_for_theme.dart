import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/utils/style/themes.dart';
import 'package:sferius_ai/generated/l10n.dart';
import 'package:sferius_ai/utils/app_colors.dart';
import 'package:svg_flutter/svg.dart';

class BottomSheetForTheme extends StatelessWidget {
  const BottomSheetForTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -36.h,
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            'assets/svg/background2.svg',
            width: double.infinity,
            height: 60.h,
            color: isDark ? AppColors.c1C1C1E : AppColors.backgroundColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.c1C1C1E : AppColors.backgroundColor,
          ),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          height: 320.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Выберите Оформление',
                  style:
                      isDark
                          ? AppTextStyles.sf20white400.copyWith(
                            letterSpacing: 0,
                          )
                          : AppTextStyles.sf20black400.copyWith(
                            letterSpacing: 0,
                          ),
                ),
              ),
              SizedBox(height: 24.h),
              _buildThemeButton(
                context: context,
                title: S.of(context).light_theme,
                onTap: () {
                  AdaptiveTheme.of(context).setLight();
                  Navigator.pop(context);
                },
              ),
              _buildThemeButton(
                context: context,
                title: S.of(context).dark_theme,
                onTap: () {
                  AdaptiveTheme.of(context).setDark();
                  Navigator.pop(context);
                },
              ),
              _buildThemeButton(
                context: context,
                title: S.of(context).like_system,
                onTap: () {
                  AdaptiveTheme.of(context).setSystem();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildThemeButton({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Ink(
          decoration: BoxDecoration(
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? AppColors.black.withOpacity(0.1)
                    : AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.c00C7BE, width: 1.2.w),
          ),
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.sf15grey400.copyWith(
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? AppColors.white
                        : AppColors.c141414,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
