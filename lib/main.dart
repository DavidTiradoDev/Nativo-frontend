import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nativo_front/core/router/app_router.dart';
import 'package:nativo_front/core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppTheme.background,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppTheme.primary,
              surface: AppTheme.background,
            ),
          ),
          title: 'Nativo',
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        );
      },
    );
  }
}
