import 'package:flutter/material.dart';
import 'package:medical_app/pages/home_layout/home_layout.dart';

class QuestionScreen extends StatelessWidget {
  static const String routeName = "ques";

  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, HomeLayout.routeName);
          },
          child: Image.asset("assets/images/close_icon.png"),
        ),
      ),
      body: Center(
        child: Text(
          "☺️ مرحبا بك \n نحن هنا لنساعدك علي فهم ما يوجد \n في نتائج التحاليل الخاصة بك وأقتراح \n التخصص الطبي المناسب لمتابعة \n .حالتك إن لَزم",
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
