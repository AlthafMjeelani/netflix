import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';

class CostomButton extends StatelessWidget {
  const CostomButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconSize,
    required this.fontSize,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final double iconSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: whiteColorText,
            size: iconSize,
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w800),
        )
      ],
    );
  }
}
