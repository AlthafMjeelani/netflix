import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/costents.dart';

class SectionOne extends StatelessWidget {
  const SectionOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: whiteColorText,
        ),
        kwidth,
        Text(
          'Smart Downloads',
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
