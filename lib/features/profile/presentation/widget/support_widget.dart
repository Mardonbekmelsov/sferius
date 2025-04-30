// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/widgets/custom_button.dart';
import 'package:sferius_ai/generated/l10n.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri phoneUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );

  if (await canLaunchUrl(phoneUri)) {
    await launchUrl(phoneUri);
  } else {
    throw 'Could not launch $phoneUri';
  }
}

class SupportWidget extends StatelessWidget {
  const SupportWidget({super.key});
  final String telegramUrl = 'https://t.me/pro1_manager';

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: -36.h,
          child: SvgPicture.asset(
            'assets/svg/background2.svg',
            width: double.infinity,
            height: 60.h,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.c1C1C1E
                : AppColors.backgroundColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.c1C1C1E
                : AppColors.backgroundColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Text(
                S.of(context).tech_support,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 20.sp,
                    ),
              ),
              SizedBox(height: 10.h),
              Text(
                S.of(context).support_text,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 17.sp,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.h),
              CustomButton(
                buttonColor: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.backgroundColor
                    : AppColors.c141414,
                title: S.of(context).write_to_telegram,
                onTap: () async {
                  if (await canLaunchUrl(Uri.parse(telegramUrl))) {
                    await launchUrl(Uri.parse(telegramUrl));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Could not launch Telegram'),
                      ),
                    );
                  }
                },
                titleColor: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.c141414
                    : AppColors.backgroundColor,
              ),
              SizedBox(height: 10.h),
              CustomButton(
                buttonColor: AppColors.c00C7BE,
                title: S.of(context).call,
                onTap: () {
                  makePhoneCall('+998901313301');
                },
                titleColor: AppColors.white,
              ),
              SizedBox(height: 34.h),
            ],
          ),
        ),
      ],
    );
  }
}
