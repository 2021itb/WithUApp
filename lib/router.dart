import 'package:go_router/go_router.dart';
import 'package:with_u/presentation/screen/chat/chat_screen.dart';
import 'package:with_u/presentation/screen/information/information_screen.dart';
import 'package:with_u/presentation/screen/splash/splash_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/information',
      builder: (context, state) => const InformationScreen(),
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) => const ChatScreen(),
    ),
  ],
);
