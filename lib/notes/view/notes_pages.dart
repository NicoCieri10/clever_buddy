import 'package:core/core.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  static const route = '/notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
