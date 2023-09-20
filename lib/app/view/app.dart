import 'package:appsize/appsize.dart';
import 'package:clever_buddy/counter/counter.dart';
import 'package:clever_buddy/home/home.dart';
import 'package:clever_buddy/l10n/l10n.dart';
import 'package:clever_buddy/login/login.dart';
import 'package:core/core.dart';

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
        child: AppSize(
          builder: (context, orientation, deviceType) => const App(),
        ),
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
    _router = router(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: ThemeColors.primaryColor,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }

  GoRouter router(BuildContext context) {
    return GoRouter(
      initialLocation: '/',
      errorBuilder: (_, state) => const RoutingErrorPage(),
      routes: <GoRoute>[
        GoRoute(
          path: LoginPage.route,
          name: LoginPage.route,
          builder: (_, state) => const LoginPage(),
        ),
        GoRoute(
          path: HomePage.route,
          name: HomePage.route,
          builder: (_, state) => const HomePage(),
        ),
        GoRoute(
          path: CounterPage.route,
          name: CounterPage.route,
          builder: (_, state) => const CounterPage(),
        ),
      ],
      redirect: (context, state) {
        if (state.matchedLocation == '/') {
          return LoginPage.route;
        }
        return null;
      },
    );
  }
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
