part of '../app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final GoRouter _router;

  final _overlayStyle = const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  @override
  void initState() {
    super.initState();
    _router = router(context);
    SystemChrome.setSystemUIOverlayStyle(_overlayStyle);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return MaterialApp.router(
      title: 'Clever Buddy',
      routerConfig: _router,
      theme: const AppTheme(ThemeColors.primary).theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        return MediaQuery(
          data: mediaQuery.copyWith(textScaler: TextScaler.noScaling),
          child: Sizer(
            builder: (_, __, ___) => child!,
          ),
        );
      },
    );
  }

  GoRouter router(BuildContext context) {
    return GoRouter(
      initialLocation: SplashPage.route,
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
      redirect: _routerRedirect,
    );
  }

  FutureOr<String?> _routerRedirect(
    BuildContext context,
    GoRouterState state,
  ) {
    final currentUser = Supabase.instance.client.auth.currentUser;

    final authRoutes = [
      SplashPage.route,
      LoginPage.route,
      RegisterPage.route,
    ];

    /// User not authenticated
    if (currentUser == null) {
      final allowedRoutes = authRoutes;

      if (!allowedRoutes.contains(state.uri.toString())) {
        return LoginPage.route;
      }
    }

    return null;
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
