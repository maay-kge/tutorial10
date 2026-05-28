import 'package:flutter/material.dart';
import 'package:tutorial08/screens/login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechService',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0XFF1E3A8A),
          primary: const Color(0XFF1E3A8A),
          ),
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Color(0XFFF8FAFC),
          ),
      ),
      home: const LoginScreen(),
    );
  }
}
