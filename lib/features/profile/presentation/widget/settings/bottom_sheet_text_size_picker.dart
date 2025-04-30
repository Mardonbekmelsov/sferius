import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/blocs/chat_text_size_cubit.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/utils/style/themes.dart';
import 'package:svg_flutter/svg.dart';

class BottomSheetTextSizePicker extends StatelessWidget {
  const BottomSheetTextSizePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ChatTextSizeCubit>();
    final List<double> sizes =
        List.generate(13, (index) => 12.0 + index.toDouble());

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -36.h,
          left: 0,
          right: 0,
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
          height: 320.h,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.c1C1C1E
                : AppColors.backgroundColor,
          ),
          child: Column(
            children: [
              SizedBox(height: 12.h),
              Text(
                'Размер текста',
                style: Theme.of(context).brightness == Brightness.dark
                    ? AppTextStyles.sf20white400.copyWith(fontSize: cubit.state)
                    : AppTextStyles.sf20black400
                        .copyWith(fontSize: cubit.state, letterSpacing: 0),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: BlocBuilder<ChatTextSizeCubit, double>(
                  builder: (context, currentSize) {
                    return CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                        initialItem: sizes.indexOf(currentSize),
                      ),
                      itemExtent: 40.h,
                      onSelectedItemChanged: (index) {
                        cubit.changeSize(sizes[index]);
                      },
                      children: sizes
                          .map(
                            (size) => Center(
                              child: Text(
                                size.toInt().toString(),
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                'Выберите подходящий размер текста',
                style: AppTextStyles.sf15grey400,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ],
    );
  }
}
