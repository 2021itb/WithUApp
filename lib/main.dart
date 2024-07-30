import 'package:flutter/material.dart';
import 'package:with_u/router.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'data/dto/user_info.dart';
import 'package:provider/provider.dart';
import 'package:with_u/data/repository/user_info_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  // Register the adapter
  Hive.registerAdapter(UserInfoAdapter());

  // 저장된 유저 인포 출력 테스트.
  final box = await Hive.openBox('userInfoBox');
  box.values.toList().forEach((value) {
    if (value is UserInfo) {
      print(value.name);
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserInfoRepository>(
          create: (context) => UserInfoRepository(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
      ),
    );
  }
}
