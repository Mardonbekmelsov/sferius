import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/utils/ui_needs/app_svg.dart';
import 'package:sferius_ai/features/profile/presentation/widget/info_widget.dart';
import 'package:sferius_ai/generated/l10n.dart';
import 'package:sferius_ai/utils/app_colors.dart';
import 'package:svg_flutter/svg.dart';


class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.black
          : AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
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
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.c1C1C1E
                  : AppColors.backgroundColor,
              child: SizedBox(
                height: 15.h,
                child: SvgPicture.asset(
                  AppSvg.arrow,
                    height: 14.sp,
                width: 9.sp,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? AppColors.white
                        : AppColors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
        title: Text(
          S.of(context).about,
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 20.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              InfoWidget(
                name: "Sfere",
                version: "${S.of(context).version} 24.0.2",
                middleName: 'Digital Eco System',
              ),
              SizedBox(height: 10.h),
              // for (int i = 0; i < profileList.length; i++)
              //   ProfileButtonItemWidget(
              //     onTap: () {},
              //     title: profileList[i],
              //     appSvg: AppSvg.sms,
              //   )
            ],
          ),
        ),
      ),
    );
  }

  List<String> profileList = [
    S.current.privacy_policy,
    S.current.license_accept,
    S.current.recommend_rules,
  ];
}
