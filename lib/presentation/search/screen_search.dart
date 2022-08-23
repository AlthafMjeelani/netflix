import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: Center(
          child: Text('Screen Search'),
        ),
      ),
    );
  }
}
