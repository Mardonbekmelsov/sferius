import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/features/profile/presentation/widget/settings/actions_widget.dart';
import 'package:sferius_ai/features/profile/presentation/widget/settings/interface_settings_widget.dart';
import 'package:sferius_ai/generated/l10n.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/utils/style/colors.dart';
import '../../../../core/utils/ui_needs/app_svg.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).brightness == Brightness.dark
              ? AppColors.black
              : AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor:
            Theme.of(context).brightness == Brightness.dark
                ? AppColors.black
                : AppColors.white,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              radius: 22.r,
              backgroundColor:
                  Theme.of(context).brightness == Brightness.dark
                      ? AppColors.c2C2C2E
                      : AppColors.cF8F8F8,
              child: SizedBox(
                height: 15.h,
                child: SvgPicture.asset(
                  AppSvg.arrow,
                    height: 14.sp,
                width: 9.sp,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? AppColors.cF8F8F8
                        : AppColors.c2C2C2E,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
        title: Text(
          S.of(context).settings,
          style: Theme.of(
            context,
          ).textTheme.displayMedium?.copyWith(fontSize: 20.sp),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 8),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            children: [
              const InterfaceSettingsWidget(),
              SizedBox(height: 10.h),
              const ActionsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
