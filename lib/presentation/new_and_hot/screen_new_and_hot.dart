import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: Center(
          child: Text('Screen New And Hot'),
        ),
      ),
    );
  }
}
