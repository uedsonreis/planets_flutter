import 'package:flutter/material.dart';
import 'package:planets_app/pages/planets_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const PlanetsPage(),
    );
  }
}
