// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/utils/ui_needs/app_png.dart';
import 'package:sferius_ai/core/widgets/custom_button.dart';
import 'package:sferius_ai/features/profile/presentation/widget/custom_icon_bottom_sheet.dart';
import 'package:sferius_ai/generated/l10n.dart';

import 'account_management_item_widget.dart';

class AccountManagementWidget extends StatelessWidget {
  const AccountManagementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14.r),
          topRight: Radius.circular(14.r),
        ),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          const CustomIconBottomSheet(),
          SizedBox(height: 20.h),
          Text(
            S.of(context).account_management,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 20.sp,
                ),
          ),
          SizedBox(height: 10.h),
          Text(
            "Выберите или добавьте новыйаккаунт для входа",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 17.sp,
                  color: AppColors.c141414.withOpacity(.4),
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.h),
          for (int i = 0; i < 2; i++)
            AccountManagementItemWidget(
              title: 'Azizbek Narzullayev',
              onTap: () {},
              image: AppPng.image,
              phoneNumber: "+998 88 780 3635",
            ),
          const Spacer(),
          CustomButton(
            buttonColor: AppColors.c00C7BE,
            title: 'Добавить аккаунт',
            onTap: () {},
            titleColor: AppColors.white,
          ),
          SizedBox(height: 14.h),
        ],
      ),
    );
  }
}
