import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/features/profile/presentation/widget/logout_bottom_sheet.dart';
import 'package:sferius_ai/features/profile/presentation/widget/settings/actions_item_widget.dart';
import 'package:sferius_ai/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/ui_needs/app_svg.dart';

class ActionsWidget extends StatefulWidget {
  const ActionsWidget({super.key});

  @override
  State<ActionsWidget> createState() => _ActionsWidgetState();
}

class _ActionsWidgetState extends State<ActionsWidget> {
  List svgList = [AppSvg.trash, AppSvg.logOut];

  List titleList = [S.current.delete_account, S.current.sign_out];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Действия",
          style: Theme.of(
            context,
          ).textTheme.displayMedium?.copyWith(fontSize: 20.sp),
        ),
        SizedBox(height: 10.h),
        for (int i = 0; i < svgList.length; i++)
          ActionsItemWidget(
            title: titleList[i],
            onTap:
                i == 1
                    ? () async {
                      showLogoutBottomSheet(context);
                    }
                    : i == 0
                    ? () async {
                      final url = Uri.parse('https://id.sfere.pro');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    }
                    : () {},
            appSvg: svgList[i],
            isTitleRed: i != 2,
          ),
      ],
    );
  }
}
