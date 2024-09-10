import 'package:flutter/material.dart';

import 'package:the_quran/app/intro/view/widget/intro_sub_title_widget.dart';

import 'view/widget/intro_image_button_stack_widget.dart';

import 'view/widget/intro_title_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntroTitleWidget(),
            IntroSubTitleWidget(),
            IntroImageButtonStackWidget()
          ],
        ),
      ),
    );
  }
}
