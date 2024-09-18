import 'package:flutter/material.dart';

import 'app_routes.dart';
import 'theme.dart';
import 'view/login/login.dart';

void main() {
  runApp(const MainApp());

/*  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
    ),
  );*/
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Login(),
      routes: AppRoutes.routes,
      // theme: AppTheme.lightTheme,
    );
  }
}
