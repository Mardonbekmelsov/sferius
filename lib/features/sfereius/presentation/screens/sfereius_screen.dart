// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sferius_ai/core/constants/app_constants.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/utils/style/themes.dart';
import 'package:sferius_ai/core/utils/ui_needs/app_svg.dart';
import 'package:sferius_ai/core/widgets/custom_bottom_sheet.dart';
import 'package:sferius_ai/core/widgets/custom_error_widget.dart';
import 'package:sferius_ai/core/widgets/custom_loader.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_bloc.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_state.dart';
import 'package:sferius_ai/features/sfereius/domain/entities/chat_entity.dart';
import 'package:sferius_ai/features/sfereius/presentation/blocs/chat_bloc.dart';
import 'package:sferius_ai/features/sfereius/presentation/widgets/all_chats_list.dart';
import 'package:sferius_ai/generated/l10n.dart';
import 'package:sferius_ai/service_locator.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SfereiusScreen extends StatefulWidget {
  const SfereiusScreen({super.key});

  @override
  State<SfereiusScreen> createState() => _SfereiusScreenState();
}

class _SfereiusScreenState extends State<SfereiusScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ChatBloc>().add(
          ChatEvent.getAllChats(1, sl<AuthenticateBloc>()),
        );
      },
      child: Scaffold(
        backgroundColor:
            Theme.of(context).brightness == Brightness.dark
                ? AppColors.black
                : AppColors.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor:
              Theme.of(context).brightness == Brightness.dark
                  ? AppColors.c1C1C1E
                  : AppColors.white,
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: AppConstants.gradientColors[0],
                ).createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                );
              },
              blendMode: BlendMode.srcIn,
              child: Text(
                'Sferius AI',
                style: TextStyle(
                  fontSize: 36.w,
                  letterSpacing: -1.5.sp,
                  height: 1.2,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 8.w, bottom: 8.h),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => context.pushNamed('profile'),
                child: CircleAvatar(
                  radius: 22.w,
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.dark
                          ? AppColors.c2C2C2E
                          : AppColors.cF8F8F8,
                  child: SvgPicture.asset(
                    AppSvg.account,
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? AppColors.white
                            : AppColors.c2C2C2E,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 144.w,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 8.w, top: 8),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.pushNamed(
                            'chat_screen',
                            extra: {
                              'default_chat':
                                  'Расскажи интересные факты о животных',
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 4.w),
                          padding: EdgeInsets.all(8.w),
                          width: 185.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.c1C1C1E
                                    : AppColors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 22.w,
                                backgroundColor:
                                    Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppColors.c2C2C2E
                                        : AppColors.cF8F8F8,
                                child: SvgPicture.asset(
                                  AppSvg.animal,
                                  color:
                                      Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? AppColors.white
                                          : AppColors.c2C2C2E,
                                ),
                              ),
                              Text(
                                overflow: TextOverflow.ellipsis,
                                'Расскажи интересные факты о животных',
                                style:
                                    Theme.of(context).brightness ==
                                            Brightness.light
                                        ? AppTextStyles.sf14black400
                                        : AppTextStyles.sf14white400,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              BlocBuilder<AuthenticateBloc, AuthenticateState>(
                builder: (context, state) {
                  if (state is UnAuthenticated) {
                    return SliverToBoxAdapter(child: Container());
                  }
                  return SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 12.h,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            S.of(context).recent_chats,
                            style:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppTextStyles.sf20white500
                                    : AppTextStyles.sf20black500,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed('all_chats');
                            },
                            child: Text(
                              S.of(context).see_all,
                              style: AppTextStyles.sf14grey400,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<AuthenticateBloc, AuthenticateState>(
                builder: (context, state) {
                  if (state is Authenticated) {
                    return AllChatsList();
                  }
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 500.h,
                      child: Center(
                        child: Text(
                          S.of(context).sferius_pro_id,
                          style:
                              Theme.of(context).brightness == Brightness.dark
                                  ? AppTextStyles.sf18white500.copyWith(
                                    fontSize: 17,
                                  )
                                  : AppTextStyles.sf18black500.copyWith(
                                    fontSize: 17,
                                  ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        bottomSheet: CustomBottomSheet(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              //   child: CircleAvatar(
              //     radius: 28.w,
              //     backgroundColor:
              //         Theme.of(context).brightness == Brightness.dark
              //             ? AppColors.c2C2C2E
              //             : AppColors.c00C7BE,
              //     child: SvgPicture.asset(
              //       AppSvg.sferius,
              //       colorFilter: ColorFilter.mode(
              //         Theme.of(context).brightness == Brightness.dark
              //             ? AppColors.c00C7BE
              //             : Colors.white,
              //         BlendMode.srcIn,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(width: 8.w),
              Expanded(
                // Moved Expanded here
                child: GestureDetector(
                  behavior:
                      HitTestBehavior.translucent, // Ensures it captures taps
                  onTap: () {
                    // context.read<ChatBloc>().add(ChatEvent.clearMessages());
                    context.pushNamed('chat_screen');
                  },
                  child: Container(
                    width: 310.w,
                    height: 80.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      gradient: LinearGradient(
                        colors: AppConstants.gradientColors[0],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        S.of(context).ask_sferius,
                        style: AppTextStyles.sf17white500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
