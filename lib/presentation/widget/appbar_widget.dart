import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixapp/core/costents.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Text(
          'Downloads',
          style: GoogleFonts.montserrat(
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.cast,
            color: Colors.white,
            size: 30,
          ),
        ),
        Container(
          width: 30,
          height: 30,
          color: Colors.blue,
        ),
        kwidth,
      ],
    );
  }
}
