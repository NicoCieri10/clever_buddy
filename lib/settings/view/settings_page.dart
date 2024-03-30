import 'package:core/core.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Flexible(
            child: Column(
              children: [
                Spacer(),
                Text('Settings'),
                Spacer(),
              ],
            ),
          ),
          CustomNavBar(selectedItem: NavBarItems.settings),
        ],
      ),
    );
  }
}
