import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/application_theme.dart';
import 'package:medical_app/pages/history_screen/history_screen.dart';
import 'package:medical_app/pages/home_layout/home_layout.dart';
import 'package:medical_app/pages/question_screen/question_screen.dart';
import 'package:medical_app/pages/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeLayout.routeName: (context) => const HomeLayout(),
        QuestionScreen.routeName: (context) => const QuestionScreen(),
        HistoryScreen.routeName: (context) => HistoryScreen()
      },
      theme: ApplicationTheme.theme,
    );
  }
}
