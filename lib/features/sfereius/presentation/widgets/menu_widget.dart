// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/utils/style/themes.dart';
import 'package:sferius_ai/features/sfereius/presentation/widgets/tile_widget.dart';
import 'package:sferius_ai/generated/l10n.dart';
import 'package:svg_flutter/svg_flutter.dart';

class MenuWidget extends StatelessWidget {
  MenuWidget({super.key});

  final List<Map<String, dynamic>> menuItems = [
    {'icon': 'assets/svg/chat2.svg', 'title': 'Все чаты', 'hasEnterIcon': true},
    {
      'icon': 'assets/svg/setting.svg',
      'title': S.current.settings,
      'hasEnterIcon': true
    },
    {
      'icon': 'assets/svg/delete.svg',
      'title': S.current.clear_chat_history,
      'hasEnterIcon': false
    },
    {
      'icon': 'assets/svg/share.svg',
      'title': S.current.share_chat,
      'hasEnterIcon': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allows SVG to overflow
      children: [
        // SVG Positioned ABOVE the bottom sheet
        Positioned(
          top: -36.h, // Move it upwards
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            'assets/svg/background2.svg',
            width: double.infinity,
            height: 60.h, // Adjust height
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.c1C1C1E
                : AppColors.backgroundColor,
          ),
        ),

        // Bottom Sheet Container
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.c1C1C1E
                : AppColors.backgroundColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Меню',
                style: Theme.of(context).brightness == Brightness.dark
                    ? AppTextStyles.sf20white500
                    : AppTextStyles.sf20black500,
              ),
              SizedBox(height: 4.h),
              ...menuItems.map((item) => TileWidget(
                    iconAddress: item['icon'],
                    title: item['title'],
                    hasEntericon: item['hasEnterIcon'],
                  )),
              SizedBox(height: 12.h),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.cE33629,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24.r,
                      backgroundColor: AppColors.cF8F8F8,
                      child: SvgPicture.asset('assets/svg/delete.svg',
                          color: AppColors.cE33629),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        S.of(context).delete_chat,
                        style: AppTextStyles.sf16white400,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
