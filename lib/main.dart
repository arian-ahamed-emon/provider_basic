import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_to_do/provider/to_do_provider.dart';
import 'package:provider_to_do/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ToDoProvider>(create: (_) => ToDoProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To do list',
      home: HomeScreen(),
    );
  }
}
