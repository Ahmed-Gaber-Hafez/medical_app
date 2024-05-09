
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_app/pages/history_screen/history_screen.dart';
import 'package:medical_app/pages/question_screen/question_screen.dart';

import '../display_image/display_image.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "home";

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => pickImage(ImageSource.gallery),
                          child: Image.asset("assets/images/upload_icon.png"),
                        ),
                        Text(
                          "Upload",
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => pickImage(ImageSource.camera),
                          child: Image.asset("assets/images/camera_icon.png"),
                        ),
                        Text(
                          "Scan",
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, HistoryScreen.routeName),
                      child: Column(
                        children: [
                          Image.asset("assets/images/history_icon.png"),
                          Text(
                            "History",
                            style: theme.textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, QuestionScreen.routeName);
                  },
                  child: Image.asset("assets/images/question_icon.png"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) return;
    setState(() {
      _image = File(pickedFile.path);
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageDisplayScreen(image: _image),
      ),
    );
  }
}
