import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/presentation/home/widgets/custom_button.dart';
import 'package:netflixapp/presentation/search/widgets/video_card_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterpath;
  final String movieName;
  final String description;
  const EveryonesWatchingWidget({
    Key? key,
    required this.posterpath,
    required this.movieName,
    required this.description,
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
            movieName,
            style: newAndHotTextStyle,
          ),
          kHeight,
          Text(
            description,
            maxLines: 5,
            style: const TextStyle(
              color: greyColor,
            ),
          ),
          kHeight25,
          NewAndHoteCardWidget(
            imageurl: posterpath,
          ),
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
