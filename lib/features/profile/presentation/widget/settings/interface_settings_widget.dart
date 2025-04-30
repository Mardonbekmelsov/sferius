import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/utils/ui_needs/app_svg.dart';
import 'package:sferius_ai/features/profile/presentation/widget/settings/bottom_sheet_for_theme.dart';
import 'package:sferius_ai/features/profile/presentation/widget/settings/bottom_sheet_text_size_picker.dart';
import 'package:sferius_ai/features/profile/presentation/widget/settings/main_settings_item_widget.dart';
import 'package:sferius_ai/generated/l10n.dart';

class InterfaceSettingsWidget extends StatefulWidget {
  const InterfaceSettingsWidget({super.key});

  @override
  State<InterfaceSettingsWidget> createState() => _MainSettingsWidgetState();
}

class _MainSettingsWidgetState extends State<InterfaceSettingsWidget> {
  List svgList = [
    AppSvg.themeSettings,
    AppSvg.shrift,
  ];
  List titleList = [
    S.current.decoration,
    S.current.font_size,
  ];
  List subtitleList = [
    "Как в системе",
    "100%",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Интерфейс",
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 20.sp,
              ),
        ),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: () {},
          child: MainSettingsItemWidget(
            title: S.of(context).decoration,
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BottomSheetForTheme();
                  });
            },
            appSvg: AppSvg.themeSettings,
            subTitle: 'Как в системе',
          ),
        ),
        MainSettingsItemWidget(
          title: S.of(context).font_size,
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return BottomSheetTextSizePicker();
                });
          },
          appSvg: AppSvg.shrift,
          subTitle: '100%',
        ),
      ],
    );
  }
}
