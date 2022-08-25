import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/costents.dart';

class NewAndHoteCardWidget extends StatelessWidget {
  const NewAndHoteCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            homepageImage[7],
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off_outlined,
                size: 30,
                color: whiteColorText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
