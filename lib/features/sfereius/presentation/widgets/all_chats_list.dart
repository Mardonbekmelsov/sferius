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
import 'package:sferius_ai/service_locator.dart';
import 'package:svg_flutter/svg.dart';

class AllChatsList extends StatefulWidget {
  const AllChatsList({super.key});

  @override
  State<AllChatsList> createState() => _AllChatsListState();
}

class _AllChatsListState extends State<AllChatsList> {
  @override
  void initState() {
    context.read<ChatBloc>().add(
      ChatEvent.getAllChats(1, sl<AuthenticateBloc>()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        if (state.status == Status.Loading) {
          return const SliverToBoxAdapter(child: CustomLoader());
        } else if (state.status == Status.Error) {
          return const SliverToBoxAdapter(child: CustomErrorWidgetSearch());
        } else if (state.status == Status.Success) {
          // final List<ChatEntity> chats = state.chats!;
          final List<ChatEntity>? chats = state.chats;
          if (chats == null || chats.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(child: Text("No chats yet")),
            );
          }

          chats.reversed;
          // log(chats.toString());
          return chats.isEmpty
              ? const SliverToBoxAdapter(
                child: Center(child: Text("No chats yet")),
              )
              : StatefulBuilder(
                builder:
                    (context, setState) => SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return GestureDetector(
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
                                borderRadius: BorderRadius.circular(100.r),
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
                                              : AppTextStyles.sf14black400,
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
                          );
                        },
                        // childCount: isExtended ? chats.length : 5,
                        childCount: chats.length > 5 ? 5 : chats.length,
                      ),
                    ),
              );
        }
        return const SliverToBoxAdapter(
          child: SizedBox(),
        ); // Ensure a valid Sliver widget is always returned
      },
    );
  }
}
