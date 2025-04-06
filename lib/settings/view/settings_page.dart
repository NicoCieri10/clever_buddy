import 'package:clever_buddy/auth/auth.dart';
import 'package:clever_buddy/home/home.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const route = '/settings';

  @override
  Widget build(BuildContext context) {
    return const SettingsView();
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    void onSignOut() {
      AuthManager.signOut();
      context.goNamed(LoginPage.route);
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        context.goNamed(HomePage.route);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Flexible(
              child: Column(
                children: [
                  const Spacer(),
                  const Text('Settings'),
                  const Spacer(),
                  CustomButton(
                    text: 'Sign out',
                    width: 80.w,
                    onPressed: onSignOut,
                  ),
                  Gap(2.h),
                ],
              ),
            ),
            const CustomNavBar(selectedItem: NavBarItems.settings),
          ],
        ),
      ),
    );
  }
}
