import 'package:flutter/material.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/presentation/home/widgets/custom_button.dart';

import '../../../core/colors/colors.dart';

class BackgroundcardWidget extends StatelessWidget {
  const BackgroundcardWidget({
    Key? key,
    required this.backGroundImage,
  }) : super(key: key);
  final List<String> backGroundImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 600,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(backGroundImage[0]),
              fit: BoxFit.fill,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  CostomButton(
                    icon: Icons.add,
                    text: 'My List',
                    fontSize: 16,
                    iconSize: 30,
                  ),
                  PlayButtonWidget(),
                  CostomButton(
                    icon: Icons.info_outline,
                    fontSize: 16,
                    iconSize: 30,
                    text: 'info',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PlayButtonWidget extends StatelessWidget {
  const PlayButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(whiteColorText)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          color: blackColorText,
          size: 25,
        ),
        label: const Text(
          'Play',
          style: TextStyle(color: blackColorText, fontSize: 20),
        ));
  }
}
