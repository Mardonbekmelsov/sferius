
import 'package:flutter/material.dart';
import 'package:sferius_ai/generated/l10n.dart';
import 'package:sferius_ai/utils/app_colors.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Theme.of(context).brightness==Brightness.dark? AppColors.backgroundColor: AppColors.black,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        title:  Text(S.of(context).personal_info),
      ),
    );
  }
}
