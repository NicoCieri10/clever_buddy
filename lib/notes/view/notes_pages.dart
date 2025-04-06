import 'package:clever_buddy/home/home.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  static const route = '/notes';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        context.goNamed(HomePage.route);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
          centerTitle: true,
        ),
        body: const Column(
          children: [
            Flexible(
              child: Column(
                children: [
                  Spacer(),
                  Text('Notes'),
                  Spacer(),
                ],
              ),
            ),
            CustomNavBar(selectedItem: NavBarItems.notes),
          ],
        ),
      ),
    );
  }
}
