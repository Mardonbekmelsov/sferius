import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sferius_ai/core/blocs/chat_text_size_cubit.dart';
import 'package:sferius_ai/core/localization/cubit/localization_cubit.dart';
import 'package:sferius_ai/core/route/router.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_bloc.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/bloc/login_bloc.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:sferius_ai/features/sfereius/presentation/blocs/chat_bloc.dart';
import 'package:sferius_ai/generated/l10n.dart';
import 'package:sferius_ai/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Only allow portrait mode
  ]).then((_) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        // systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<LoginBloc>()),
        BlocProvider(create: (_) => sl<LocaleCubit>()..loadSavedLocale()),
        BlocProvider(create: (_) => sl<ChatBloc>()),
        BlocProvider(create: (_) => sl<AuthenticateBloc>()),
        BlocProvider(create: (_) => sl<UserBloc>()),
        BlocProvider(create: (_) => sl<ChatTextSizeCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return AdaptiveTheme(
            light: ThemeData.light(),
            dark: ThemeData.dark(),
            initial: AdaptiveThemeMode.system,
            builder: (theme, darkTheme) {
              return BlocBuilder<LocaleCubit, Locale>(
                builder: (context, locale) {
                  return MaterialApp.router(
                    routerConfig: router,
                    theme: theme,
                    darkTheme: darkTheme,
                    locale: locale,
                    supportedLocales: S.delegate.supportedLocales,
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    debugShowCheckedModeBanner: false,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
