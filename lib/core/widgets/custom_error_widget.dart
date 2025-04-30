import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sferius_ai/generated/l10n.dart';

class CustomErrorWidgetSearch extends StatelessWidget {
  const CustomErrorWidgetSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            width: 180.h,
            height: 180.h,
            'assets/lottie/lottie_server.json',
          ),
          SizedBox(
            height: 20.h,
          ),
           Text(
            S.of(context).server_exception,
            style: const TextStyle(fontSize: 17, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
