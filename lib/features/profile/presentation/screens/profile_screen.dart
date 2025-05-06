import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sferius_ai/core/utils/ui_needs/app_svg.dart';
import 'package:sferius_ai/core/widgets/custom_app_bar.dart';
import 'package:sferius_ai/core/widgets/custom_button.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_bloc.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_event.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_state.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/bloc/login_bloc.dart';
import 'package:sferius_ai/features/profile/presentation/widget/account_widget.dart';
import 'package:sferius_ai/features/profile/presentation/widget/profile_button_item_widget.dart';
import 'package:sferius_ai/features/profile/presentation/widget/support_widget.dart';
import 'package:sferius_ai/generated/l10n.dart';
import 'package:sferius_ai/utils/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<AuthenticateBloc>().add(CheckAuthenticate());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).brightness == Brightness.dark
              ? AppColors.black
              : AppColors.backgroundColor,
      appBar: customAppBar(
        hasFilterIcon: false,
        context: context,
        onTapCloseOrAccount: () {
          Navigator.pop(context);
        },
        title: S.of(context).profile,
        isAccountIcon: false,
      ),
      body: BlocBuilder<AuthenticateBloc, AuthenticateState>(
        bloc: context.read<AuthenticateBloc>()..add(CheckAuthenticate()),
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
              top: 8.h,
              left: 8.w,
              right: 8.w,
              bottom: 34.h,
            ),
            child: Column(
              children: [
                state is Authenticated ? AccountWidget() : SizedBox(),
                SizedBox(height: 8.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: svgList.length,
                    itemBuilder: (context, index) {
                      return ProfileButtonItemWidget(
                        onTap: () {
                          if (index == 0) {
                            context.pushNamed('settings');
                          } else if (index == 1) {
                            showModalBottomSheet(
                              barrierColor: Colors.black.withOpacity(0.5),
                              context: context,
                              backgroundColor: AppColors.transparent,
                              builder: (context) {
                                return const SupportWidget();
                              },
                            );
                          } else if (index == 2) {
                            context.pushNamed('info');
                          }
                        },
                        title: profileList[index],
                        appSvg: svgList[index],
                      );
                    },
                  ),
                ),
                state is UnAuthenticated
                    ? Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButton(
                        buttonColor: AppColors.c00C7BE,
                        title: "Войти в аккаунт",
                        onTap: () {
                          context.read<LoginBloc>().add(
                            LoginUserEvent(
                              authenticateBloc:
                                  context.read<AuthenticateBloc>(),
                            ),
                          );
                          context.read<AuthenticateBloc>().add(
                            CheckAuthenticate(),
                          );
                          context.goNamed("sferius");
                        },
                        titleColor: AppColors.white,
                      ),
                    )
                    : const SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }

  List<String> svgList = [
    // AppSvg.account,
    // AppSvg.accountSetting,
    // AppSvg.sms,
    AppSvg.setting,
    AppSvg.support,
    AppSvg.info,
  ];

  List<String> profileList = [
    // "Персональные данные",
    // "Управление аккаунтами",
    // "Почта",
    S.current.settings,
    S.current.tech_support,
    S.current.about,
  ];
}
