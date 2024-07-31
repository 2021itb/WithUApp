import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:with_u/data/repository/chat_repository_impl.dart';
import 'package:with_u/presentation/screen/chat/chat_screen.dart';
import 'package:with_u/presentation/screen/chat/chat_view_model.dart';
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
      builder: (context, state) {
        return ChangeNotifierProvider<ChatViewModel>(
          create: (context) => ChatViewModel(repository: ChatRepositoryImpl()),
          child: const ChatScreen(),
        );
      },
    ),
  ],
);
