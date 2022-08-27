import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/costents.dart';

class TopSearchListTile extends StatelessWidget {
  const TopSearchListTile({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: size * 0.4,
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.fill,
            ),
          ),
        ),
        kwidth,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: whiteColorText,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.play_circle_outline,
                color: whiteColorText,
                size: 40,
              )),
        )
      ],
    );
  }
}
