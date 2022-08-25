import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/costents.dart';

class ScectionThree extends StatelessWidget {
  const ScectionThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: MaterialButton(
            minWidth: double.infinity,
            color: buttonColorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Setup',
                style: TextStyle(
                  color: whiteColorText,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        kHeight,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: buttonColorwhite,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'See what you can download',
                style: TextStyle(
                  color: blackColorText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
