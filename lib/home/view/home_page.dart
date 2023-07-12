import 'package:clever_buddy/home/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const name = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () => context.pushNamed('counter'),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: const Center(
        child: Text('HomePage'),
      ),
    );
  }
}
