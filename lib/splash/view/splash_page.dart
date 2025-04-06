import 'package:clever_buddy/home/home.dart';
import 'package:clever_buddy/login/login.dart';
import 'package:clever_buddy/splash/cubit/splash_cubit.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: _listener,
      child: Scaffold(
        backgroundColor: ThemeColors.primary[50],
        body: Center(
          child: Text(
            'CleverBuddy',
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, SplashState state) {
    if (state.isOffline) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text('No internet connection'),
            backgroundColor: ThemeColors.error,
          ),
        );
    } else if (state.isFailure) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(state.error ?? 'An unknown error occurred'),
            backgroundColor: ThemeColors.error,
          ),
        );
    } else if (state.isUnauthenticated) {
      context.pushReplacementNamed(LoginPage.route);
    } else if (state.isAuthenticated) {
      context.pushReplacementNamed(HomePage.route);
    }
  }
}
