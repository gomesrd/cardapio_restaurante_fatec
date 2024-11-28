import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/app_routes.dart';
import 'firebase_options.dart';
import 'store/order_store.dart';
import 'view/login/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(DevicePreview(
      enabled: true,
      builder: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => OrderStore()),
            ],
            child: const MainApp(),
          )));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: const LoginView(),
      routes: AppRoutes.routes,
      // theme: AppTheme.lightTheme,
    );
  }
}
