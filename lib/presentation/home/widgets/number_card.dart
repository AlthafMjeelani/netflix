import 'package:flutter/material.dart';
import 'package:netflixapp/core/costents.dart';

class NumberCardWidget extends StatelessWidget {
  const NumberCardWidget({
    Key? key,
    this.height,
    this.width,
    required this.listImageUrl,
  }) : super(key: key);
  final double? width;
  final double? height;
  final String listImageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            kWidth50,
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
        Text('')
      ],
    );
  }
}
