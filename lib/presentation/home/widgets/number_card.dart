import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/costents.dart';

class NumberCardWidget extends StatelessWidget {
  const NumberCardWidget({
    Key? key,
    this.height,
    this.index,
    this.width,
    required this.listImageUrl,
  }) : super(key: key);
  final double? width;
  final double? height;
  final String listImageUrl;
  final int? index;

  @override
  Widget build(BuildContext context) {
    final newIndex = index! + 1;
    return Stack(
      children: [
        Row(
          children: [
            kWidth40,
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(listImageUrl),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
        Positioned(
          left: 16,
          bottom: -10,
          child: BorderedText(
            strokeWidth: 10.0,
            strokeColor: whiteColorText,
            child: Text(
              '$newIndex',
              style: const TextStyle(
                color: blackColorText,
                fontSize: 120,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
