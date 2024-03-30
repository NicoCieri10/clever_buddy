import 'package:clever_buddy/home/home.dart';
import 'package:clever_buddy/home/widgets/widgets.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

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

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Clever Buddy',
          style: TextStyle(
            color: theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    controller: controller,
                    indicatorColor: theme.primaryColor,
                    tabs: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.sp),
                        child: Text(
                          'Home',
                          style: TextStyle(
                            color: theme.primaryColor,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.sp),
                        child: Text(
                          'Quick Session',
                          style: TextStyle(
                            color: theme.primaryColor,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: controller,
                      children: const [
                        HomeWidget(),
                        QuickSessionWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const CustomNavBar(selectedItem: NavBarItems.home),
        ],
      ),
    );
  }
}
