import 'package:flutter/material.dart';

import 'core/theme/application_theme.dart';
import 'layout/home_layout.dart';
import 'moduls/splash_screen/splash_screen.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeLayout.routeName: (context) => const HomeLayout(),
      },
      initialRoute: SplashScreen.routeName,
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightTheme,
      darkTheme: ApplicationTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
