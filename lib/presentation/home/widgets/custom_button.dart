import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';

class CostomButton extends StatelessWidget {
  const CostomButton({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

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
            size: 30,
          ),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        )
      ],
    );
  }
}
