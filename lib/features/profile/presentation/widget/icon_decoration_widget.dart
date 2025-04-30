import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconDecorationWidget extends StatelessWidget {
  const IconDecorationWidget(
      {super.key,
      required this.onTap,
      required this.child,
      required this.color});
  final VoidCallback onTap;
  final Center child;
  final Color color;
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 44.h,
        width: 44.w,
        child: GestureDetector(
          onTap: onTap,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: color,
            ),
            child: child,
          ),
        ),
      );
}
