import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:enlighten_astro/providers/moneyProvider.dart';
import 'package:enlighten_astro/providers/userProvider.dart';
import 'package:enlighten_astro/screens/consOptionsScreen.dart';
import 'package:enlighten_astro/screens/consultancyConf.dart';
import 'package:enlighten_astro/screens/homePage.dart';
import 'package:enlighten_astro/screens/loginScreen.dart';
import 'package:enlighten_astro/screens/paymentConfScreen.dart';
import 'package:enlighten_astro/screens/paymentScreen.dart';
import 'package:enlighten_astro/screens/profileScreen.dart';
import 'package:enlighten_astro/screens/splashScreen.dart';
import 'package:enlighten_astro/screens/userDetailsScreen.dart';
import 'package:enlighten_astro/screens/walletScreen.dart';
import 'package:enlighten_astro/utils/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Preferences.load();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MoneyProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Enlighten Astro",
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        primaryColor: const Color.fromARGB(255, 255, 119, 0),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            backgroundColor: const Color.fromARGB(255, 255, 119, 0),
          ),
        ),
      ),
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      // home: LoginScreen(),
    );
  }

  final GoRouter _router = GoRouter(
    errorBuilder: ((context, state) => const Scaffold(
          body: Text("ERROR! NO ROUTE"),
        )),
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return SplashScreen();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return HomePage();
        },
      ),
      GoRoute(
        path: '/consOptions',
        builder: (BuildContext context, GoRouterState state) {
          return ConsOptionsScreen();
        },
      ),
      GoRoute(
        path: '/userDetails',
        builder: (BuildContext context, GoRouterState state) {
          return UserDetailsScreen();
        },
      ),
      GoRoute(
        path: '/paymentConformation',
        builder: (BuildContext context, GoRouterState state) {
          return PaymentConfScreen();
        },
      ),
      GoRoute(
        path: '/wallet',
        builder: (BuildContext context, GoRouterState state) {
          return WalletScreen();
        },
      ),
      GoRoute(
        path: '/payment',
        builder: (BuildContext context, GoRouterState state) {
          return PaymentScreen();
        },
      ),
      GoRoute(
        path: '/consultancyConformation',
        builder: (BuildContext context, GoRouterState state) {
          return ConsultancyConfScreen();
        },
      ),
      GoRoute(
        path: '/profile',
        builder: (BuildContext context, GoRouterState state) {
          return ProfileScreen();
        },
      ),
    ],
  );
}
