import 'package:clever_buddy/home/cubit/home_cubit.dart';
import 'package:clever_buddy/home/home.dart';
import 'package:clever_buddy/l10n/l10n.dart';
import 'package:clever_client/clever_client.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PageApp extends StatelessWidget {
  const PageApp({super.key});

  @override
  Widget build(BuildContext context) {
    const cleverClient = CleverClient();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: cleverClient),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(),
          ),
        ],
        child: const App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = createRouter;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.amber,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }

  GoRouter get createRouter => GoRouter(
        initialLocation: '/home',
        errorBuilder: (context, state) => const RoutingErrorPage(),
        routes: <GoRoute>[
          // GoRoute(
          //   path: '/login',
          //   name: 'login',
          //   builder: (context, state) => const LoginPage(),
          // ),
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const HomePage(),
          ),
          // GoRoute(
          //   path: '/product',
          //   name: 'product',
          //   builder: (context, state) => const ProductPage(),
          // ),
        ],
      );
}

class RoutingErrorPage extends StatelessWidget {
  const RoutingErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'No hay rutas',
        ),
      ),
    );
  }
}
