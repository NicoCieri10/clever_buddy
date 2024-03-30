import 'package:clever_buddy/home/home.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clever Buddy'),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Flexible(
            child: Column(
              children: [
                Spacer(),
                Text('HomePage'),
                Spacer(),
              ],
            ),
          ),
          CustomNavBar(selectedItem: NavBarItems.home),
        ],
      ),
    );
  }
}
