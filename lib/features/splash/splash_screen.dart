import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sferius_ai/core/utils/style/colors.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_bloc.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_event.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:sferius_ai/service_locator.dart';
import 'package:svg_flutter/svg_flutter.dart';
import '../../core/utils/ui_needs/app_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).brightness == Brightness.dark
              ? AppColors.black
              : AppColors.backgroundColor,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: SvgPicture.asset(AppSvg.darkLogo),
          ),
        ),
      ),
    );
  }

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    context.read<AuthenticateBloc>().add(CheckAuthenticate());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        context.goNamed('sferius');
      });
    });

    context.read<UserBloc>().add(UserEvent.getUser(sl<AuthenticateBloc>()));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
