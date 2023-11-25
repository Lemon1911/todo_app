import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/theme/application_theme.dart';
import 'firebase_options.dart';
import 'layout/home_layout.dart';
import 'moduls/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
