import 'package:clever_buddy/home/home.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  static const route = '/calendar';

  @override
  Widget build(BuildContext context) {
    return const CalendarView();
  }
}

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

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
          title: const Text('Calendar'),
          centerTitle: true,
        ),
        body: const Column(
          children: [
            Flexible(
              child: Column(
                children: [
                  Spacer(),
                  Text('Calendar'),
                  Spacer(),
                ],
              ),
            ),
            CustomNavBar(selectedItem: NavBarItems.calendar),
          ],
        ),
      ),
    );
  }
}
