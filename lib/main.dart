import 'package:flutter/material.dart';
import 'package:qazaqsoft_test_assignment/core/theme/app_colors.dart';

import 'feature/auth/presentation/pages/auth_page.dart';
import 'injection_container.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Qazaqsoft Test Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.customMaterialColor,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          foregroundColor: Colors.black
        )
      ),
      home: const AuthPage(),
    );
  }
}
