import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/utils/ui_needs/app_svg.dart';
import 'package:sferius_ai/features/profile/presentation/widget/settings/main_settings_item_widget.dart';
import 'package:sferius_ai/generated/l10n.dart';

class MainSettingsWidget extends StatefulWidget {
  const MainSettingsWidget({super.key});

  @override
  State<MainSettingsWidget> createState() => _MainSettingsWidgetState();
}

class _MainSettingsWidgetState extends State<MainSettingsWidget> {
  List svgList = [
    AppSvg.reload1,
    AppSvg.search,
    AppSvg.locationWhite,
    AppSvg.cellular,
  ];
  List titleList = [
    S.current.synchronization,
    S.current.search_country,
    S.current.city,
    S.current.filter_mode,
  ];
  List subtitleList = [
    "Включена",
    "Узбекистан",
    "Ташкент",
    "Умеренный",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "",
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 20.sp,
              ),
        ),
        SizedBox(height: 10.h),
        for (int i = 0; i < svgList.length; i++)
          MainSettingsItemWidget(
            title: titleList[i],
            onTap: () {},
            appSvg: svgList[i],
            subTitle: subtitleList[i],
          ),
      ],
    );
  }
}
