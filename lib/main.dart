import 'package:flutter/material.dart';
import 'home/home_screen.dart';
import 'my_theme.dart';
import 'news/details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        NewsDetailsScreen.routeName: (context) => NewsDetailsScreen(),
      },
      theme: MyTheme.lightTheme,
    );
  }
}
