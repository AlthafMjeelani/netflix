import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/presentation/search/widgets/search_idle.dart';

class TopSearchListTile extends StatelessWidget {
  const TopSearchListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: size * 0.4,
          height: 80,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
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
