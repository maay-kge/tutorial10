import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial10/screens/home_screen.dart';
import 'providers/memory_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MemoryProvider(),
      child: const MemoryApp(),
    ),
  );
}

class MemoryApp extends StatelessWidget {
  const MemoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diário de Memórias',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const HomeScreen(),
    );
  }
}
