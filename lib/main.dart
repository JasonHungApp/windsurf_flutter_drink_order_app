import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/group_id_screen.dart';
import 'screens/group_detail_screen.dart';
import 'screens/drink_list_screen.dart';
import 'screens/drink_customize_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '團購飲料',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/group-id': (context) => const GroupIdScreen(),
        '/group-detail': (context) => const GroupDetailScreen(),
        '/drink-list': (context) => const DrinkListScreen(),
        '/drink-customize': (context) => const DrinkCustomizeScreen(),
      },
    );
  }
}
