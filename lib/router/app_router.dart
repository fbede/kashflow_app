import 'package:go_router/go_router.dart';
import 'package:kashflow/screens/mobile/mobile_screens.dart';
import 'package:kashflow/screens/splashscreen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => MobileLibraryPage(),
    ),
  ],
);
