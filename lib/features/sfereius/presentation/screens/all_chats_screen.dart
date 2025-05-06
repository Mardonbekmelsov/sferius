// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sferius_ai/core/constants/app_constants.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/utils/style/themes.dart';
import 'package:sferius_ai/core/utils/ui_needs/app_svg.dart';
import 'package:sferius_ai/core/widgets/custom_error_widget.dart';
import 'package:sferius_ai/core/widgets/custom_loader.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_bloc.dart';
import 'package:sferius_ai/features/sfereius/domain/entities/chat_entity.dart';
import 'package:sferius_ai/features/sfereius/presentation/blocs/chat_bloc.dart';
import 'package:sferius_ai/features/sfereius/presentation/widgets/sferius_chat_app_bar.dart';
import 'package:sferius_ai/generated/l10n.dart';
import 'package:sferius_ai/service_locator.dart';
import 'package:svg_flutter/svg.dart';

class AllChatsScreen extends StatelessWidget {
  const AllChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        context.read<ChatBloc>().add(
          ChatEvent.getAllChats(1, sl<AuthenticateBloc>()),
        );
      },
      child: Scaffold(
        backgroundColor:
            Theme.of(context).brightness == Brightness.dark
                ? AppColors.black
                : AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size(393.w, 56.w),
          child: SferiusChatAppBar(
            title: S.of(context).all_chats,
            iconAddress: 'assets/svg/delete.svg',
            onTap: () {},
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if (state.status == Status.Loading) {
                return const CustomLoader();
              } else if (state.status == Status.Error) {
                return const SliverToBoxAdapter(
                  child: CustomErrorWidgetSearch(),
                );
              } else if (state.status == Status.Success) {
                // final List<ChatEntity> chats = state.chats!;
                final List<ChatEntity>? chats = state.chats;
                if (chats == null || chats.isEmpty) {
                  return const Center(child: Text("No chats yet"));
                }

                chats.reversed;
                // log(chats.toString());
                return chats.isEmpty
                    ? const Center(child: Text("No chats yet"))
                    : StatefulBuilder(
                      builder:
                          (context, setState) => ListView.builder(
                            itemBuilder: (context, index) {
                              return Dismissible(
                                key: Key(chats[index].id),
                                direction:
                                    DismissDirection
                                        .endToStart, // Right to left
                                background: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.red,
                                  ),
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 28.w,
                                  ),
                                ),
                                onDismissed: (_) {
                                  context.read<ChatBloc>().add(
                                    ChatEvent.deleteChat(chats[index].id),
                                  );
                                  ScaffoldMessenger.of(
                                    context,
                                  ).clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Chat "${chats[index].title}" deleted',
                                      ),
                                    ),
                                  );
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    context.pushNamed(
                                      'chat_screen',
                                      extra: {'chat': chats[index]},
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 8.h),
                                    padding: EdgeInsets.all(2.w),
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Colors.white
                                              : AppColors.c1C1C1E,
                                      borderRadius: BorderRadius.circular(
                                        100.r,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 22.w,
                                          backgroundColor:
                                              Theme.of(context).brightness ==
                                                      Brightness.dark
                                                  ? AppColors.c2C2C2E
                                                  : AppColors.cF8F8F8,
                                          child: SvgPicture.asset(
                                            AppSvg.repeat,
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? AppColors.white
                                                    : AppColors.c2C2C2E,
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Expanded(
                                          child: Text(
                                            chats[index].title,
                                            style:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? AppTextStyles.sf14white400
                                                    : AppTextStyles
                                                        .sf14black400,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(12.w),
                                          child: SvgPicture.asset(
                                            AppSvg.arrowEnter,
                                            height: 10.w,
                                            width: 6.w,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: chats.length,
                          ),
                    );
              }
              return const SliverToBoxAdapter(
                child: SizedBox(),
              ); // Ensure a valid Sliver widget is always returned
            },
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       S.of(context).today,
          //       style: Theme.of(context).brightness == Brightness.dark
          //           ? AppTextStyles.sf18white500
          //           : AppTextStyles.sf18black500,
          //     ),
          //     5.height(),
          //     Expanded(
          //       child: ListView.builder(
          //         itemCount: 5,
          //         itemBuilder: (context, index) {
          //           return Container(
          //             margin: const EdgeInsets.only(bottom: 4),
          //             padding: const EdgeInsets.all(2),
          //             decoration: BoxDecoration(
          //               color: Theme.of(context).brightness == Brightness.light
          //                   ? Colors.white
          //                   : AppColors.c1C1C1E,
          //               borderRadius: BorderRadius.circular(100),
          //             ),
          //             child: Row(
          //               children: [
          //                 CircleAvatar(
          //                   radius: 22.r,
          //                   backgroundColor:
          //                       Theme.of(context).brightness == Brightness.dark
          //                           ? AppColors.c2C2C2E
          //                           : AppColors.cF8F8F8,
          //                   child: SvgPicture.asset(AppSvg.repeat,
          //                       color: Theme.of(context).brightness ==
          //                               Brightness.dark
          //                           ? AppColors.white
          //                           : AppColors.c2C2C2E),
          //                 ),
          //                 12.width(),
          //                 Expanded(
          //                   child: Text(
          //                     'Расскажи интересные факты о животных. Расскажи интересные факты о животных',
          //                     style:
          //                         Theme.of(context).brightness == Brightness.dark
          //                             ? AppTextStyles.sf14white400
          //                             : AppTextStyles.sf14black400,
          //                     overflow: TextOverflow.ellipsis,
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.all(14),
          //                   child: SvgPicture.asset(
          //                     AppSvg.arrowEnter,
          //                     height: 10.w,
          //                     width: 6.w,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
