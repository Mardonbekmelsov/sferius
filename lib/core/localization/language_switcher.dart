import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sferius_ai/core/localization/cubit/localization_cubit.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      // width: 200,
      child: DropdownButton<Locale>(
        value: Localizations.localeOf(context),
        onChanged: (Locale? newLocale) {
          if (newLocale != null) {
            context.read<LocaleCubit>().setLocale(newLocale);
          }
        },
        items: const [
          DropdownMenuItem(value: Locale('en'), child: Text('English')),
          DropdownMenuItem(value: Locale('ru'), child: Text('Russian')),
          DropdownMenuItem(value: Locale('uz'), child: Text('Uzbek')),
        ],
      ),
    );
  }
}
