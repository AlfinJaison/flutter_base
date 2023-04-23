import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/pages/login.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'login_info.dart';
import 'pages/account.dart';
import 'pages/cart.dart';
import 'pages/home.dart';
import 'shell/bottom_nav_shell.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginInfo()),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  late final GoRouter _router = GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final loggedIn = FirebaseAuth.instance.currentUser;
      final loggingIn = state.subloc == '/login';
      if (loggedIn == null) return loggingIn ? null : '/login';

      if (loggingIn) return '/';

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const Login();
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          return BottomNavigationShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) {
              return const Home();
            },
          ),
          GoRoute(
            path: '/cart',
            builder: (BuildContext context, GoRouterState state) {
              return const Cart();
            },
          ),
          GoRoute(
            path: '/account',
            builder: (BuildContext context, GoRouterState state) {
              return const Account();
            },
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      _router.refresh();
      debugPrint('Router refresh');
    });
    debugPrint('App build');
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
