import 'package:clever_buddy/calendar/calendar.dart';
import 'package:clever_buddy/home/home.dart';
import 'package:clever_buddy/l10n/l10n.dart';
import 'package:clever_buddy/login/login.dart';
import 'package:clever_buddy/notes/notes.dart';
import 'package:clever_buddy/register/register.dart';
import 'package:clever_buddy/settings/settings.dart';
import 'package:clever_buddy/splash/splash.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: const [],
      child: Sizer(
        builder: (context, orientation, deviceType) => const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = router(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Clever Buddy',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: const AppTheme(ThemeColors.primary).theme(),
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
          path: SplashPage.route,
          name: SplashPage.route,
          builder: (_, state) => SplashPage(key: state.pageKey),
        ),
        GoRoute(
          path: LoginPage.route,
          name: LoginPage.route,
          builder: (_, state) => LoginPage(key: state.pageKey),
        ),
        GoRoute(
          path: RegisterPage.route,
          name: RegisterPage.route,
          builder: (_, state) => RegisterPage(key: state.pageKey),
        ),
        GoRoute(
          path: HomePage.route,
          name: HomePage.route,
          builder: (_, state) => HomePage(key: state.pageKey),
        ),
        GoRoute(
          path: NotesPage.route,
          name: NotesPage.route,
          builder: (_, state) => NotesPage(key: state.pageKey),
        ),
        GoRoute(
          path: CalendarPage.route,
          name: CalendarPage.route,
          builder: (_, state) => CalendarPage(key: state.pageKey),
        ),
        GoRoute(
          path: SettingsPage.route,
          name: SettingsPage.route,
          builder: (_, state) => SettingsPage(key: state.pageKey),
        ),
      ],
      redirect: (context, state) {
        // if (state.matchedLocation == '/') {
        //   return LoginPage.route;
        // }
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
        child: Text('No hay rutas'),
      ),
    );
  }
}
