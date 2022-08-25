import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/presentation/home/widgets/custom_button.dart';
import 'package:netflixapp/presentation/search/widgets/video_card_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
          kwidth,
          Text(
            'Friends',
            style: newAndHotTextStyle,
          ),
          kHeight,
          const Text(
            'This hit sitcom follws the merry misadventures of six\n20 - something pals as they navigate the pitfalls of\nwork,life and love in 1990s munhattan.',
            style: TextStyle(
              color: greyColor,
            ),
          ),
          kHeight25,
          const NewAndHoteCardWidget(),
          Row(
            children: const [
              Spacer(),
              CostomButton(
                icon: Icons.share,
                text: 'Share',
                iconSize: 40,
                fontSize: 14,
              ),
              kwidth,
              CostomButton(
                icon: Icons.add,
                text: 'My List',
                iconSize: 40,
                fontSize: 14,
              ),
              kwidth,
              CostomButton(
                icon: Icons.play_arrow,
                text: 'Play',
                iconSize: 40,
                fontSize: 14,
              ),
              kwidth,
            ],
          )
        ],
      ),
    );
  }
}
