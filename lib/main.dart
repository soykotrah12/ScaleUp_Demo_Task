import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PostProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginPage(), // ✅ Start with Login
      ),
    );
  }
}
