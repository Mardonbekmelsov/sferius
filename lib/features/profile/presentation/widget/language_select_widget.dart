import 'package:flutter/material.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/core/utils/style/themes.dart';
import 'package:sferius_ai/features/profile/presentation/widget/icon_decoration_widget.dart';

class LanguageSelectWidget extends StatefulWidget {
  const LanguageSelectWidget(
      {super.key,
      required this.index,
      required this.languageName,
      required this.widget});
  final int index;
  final String languageName;
  final Widget widget;
  @override
  State<LanguageSelectWidget> createState() => _LanguageSelectWidgetState();
}

class _LanguageSelectWidgetState extends State<LanguageSelectWidget> {
  double get height => MediaQuery.of(context).size.height;

  List<String> flag = [
    'assets/png/russia.png',
    'assets/png/uzbekistan.png',
    'assets/png/england.png',
  ];

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          height: height * 0.065,
          width: double.infinity,
          child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.c_f6f6f6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconDecorationWidget(
                          onTap: () {},
                          color: AppColors.white,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(flag[widget.index]),
                            ),
                          )),
                      Text(
                        widget.languageName,
                        style: Theme.of(context).brightness == Brightness.dark
                            ? AppTextStyles.sf16white400
                            : AppTextStyles.sf16black400,
                      ),
                    ],
                  ),
                  widget.widget
                ],
              )),
        ),
      );
}
