// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/constants/app_constants.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/utils/style/themes.dart';
import 'package:sferius_ai/core/utils/ui_needs/app_svg.dart';
import 'package:sferius_ai/core/widgets/custom_loader.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_bloc.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:sferius_ai/service_locator.dart';
import 'package:svg_flutter/svg.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({
    super.key,
  });

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  @override
  void initState() {
    context.read<UserBloc>().add(UserEvent.getUser(sl<AuthenticateBloc>()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.status == Status.Loading) {
          return Row(
            children: [
              Container(
                height: 130.w,
                width: 130.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.c2C2C2E
                      : AppColors.white,
                ),
                child: Center(child: const CustomLoader()),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  height: 130.w,
                  // width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.c2C2C2E
                        : AppColors.white,
                  ),
                  child: Center(child:  CustomLoader()),
                ),
              )
            ],
          );
        } else if (state.status == Status.Success) {
          final user = state.user!;
          return Row(
            children: [
              Container(
                height: 130.w,
                width: 130.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.c2C2C2E
                      : AppColors.white,
                ),
                child: Container(
                  margin: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    image: user.avatar.isEmpty
                        ? null
                        : DecorationImage(
                            image: NetworkImage(user.avatar),
                            onError: (exception, stackTrace) {
                              Text(
                                "${user.first_name.toUpperCase()}${user.last_name.toUpperCase()}",
                                style: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? AppTextStyles.sf12black500.copyWith(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white)
                                    : AppTextStyles.sf12black500.copyWith(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                              );
                            },
                          ),
                  ),
                  child: user.avatar.isEmpty
                      ? Text(
                          "${user.first_name.toUpperCase()}${user.last_name.toUpperCase()}",
                          style: Theme.of(context).brightness == Brightness.dark
                              ? AppTextStyles.sf12black500.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white)
                              : AppTextStyles.sf12black500.copyWith(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                        )
                      : null,
                ),
              ),
              SizedBox(width: 5.w),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  height: 130.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.c2C2C2E
                        : AppColors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppSvg.sfera,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.white
                                    : AppColors.c141414.withOpacity(0.4),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            "Pro ID",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.white
                                      : AppColors.c141414.withOpacity(0.4),
                                  fontSize: 13.sp,
                                ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        user.first_name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontSize: 18.sp),
                      ),
                      Text(
                        user.phone,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontSize: 15.sp,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? AppColors.white
                                  : AppColors.c141414.withOpacity(0.4),
                            ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }
        return Container();
      },
    );
  }
}

