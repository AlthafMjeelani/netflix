import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';

class TopSearchListTile extends StatelessWidget {
  const TopSearchListTile({Key? key, required this.imageUrlsearch})
      : super(key: key);
  final String imageUrlsearch;

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
              image: NetworkImage(imageUrlsearch),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const Text(
          'Movie Name',
          style: TextStyle(
            fontSize: 16,
            color: whiteColorText,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.play_circle_outline,
              color: whiteColorText,
              size: 40,
            ))
      ],
    );
  }
}
