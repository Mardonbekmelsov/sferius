import 'package:go_router/go_router.dart';
import 'package:sferius_ai/features/profile/presentation/screens/info_screen.dart';
import 'package:sferius_ai/features/profile/presentation/screens/profile_screen.dart';
import 'package:sferius_ai/features/profile/presentation/screens/settings_screen.dart';
import 'package:sferius_ai/features/sfereius/presentation/screens/all_chats_screen.dart';
import 'package:sferius_ai/features/sfereius/presentation/screens/chat_screen.dart';
import 'package:sferius_ai/features/sfereius/presentation/screens/sfereius_screen.dart';
import 'package:sferius_ai/features/splash/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => ProfileScreen(),
    ),
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => SplashScreen(),
    ),

    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) {
        return SettingsScreen();
      },
    ),
    GoRoute(
      path: '/info',
      name: 'info',
      builder: (context, state) {
        return InfoScreen();
      },
    ),

    GoRoute(
      path: '/sferius',
      name: 'sferius',
      builder: (context, state) {
        return SfereiusScreen();
      },
    ),
    GoRoute(
      path: '/sferius/chat',
      name: 'chat_screen',
      builder: (context, state) {
        if (state.extra != null) {
          final Map<String, dynamic> extra =
              state.extra as Map<String, dynamic>;
          return ChatScreen(
            defaultChat: extra['default_chat'],
            chat: extra['chat'],
          );
        }
        return ChatScreen();
      },
    ),
    GoRoute(
      path: '/sferius/all_chats',
      name: 'all_chats',
      builder: (context, state) {
        return AllChatsScreen();
      },
    ),
  ],
);
