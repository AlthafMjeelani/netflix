import 'package:flutter/material.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/presentation/home/widgets/custom_button.dart';
import 'package:netflixapp/presentation/search/widgets/video_card_widget.dart';

import '../../../core/colors/colors.dart';

class NewAndHotComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterpath;
  final String movieName;
  final String description;
  const NewAndHotComingSoonWidget({
    Key? key,
    required this.index,
    required this.id,
    required this.month,
    required this.day,
    required this.posterpath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: const TextStyle(
                  color: greyColor,
                ),
              ),
              Text(
                day,
                style: appbarTextStyle,
              )
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 500,
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NewAndHoteCardWidget(
                  imageurl: posterpath,
                ),
                kHeight,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        movieName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: appbarTextStyle,
                      ),
                    ),
                    const CostomButton(
                      icon: Icons.add_alert,
                      fontSize: 12,
                      iconSize: 30,
                      text: 'Remind Me',
                    ),
                    const CostomButton(
                      icon: Icons.info_outline,
                      fontSize: 12,
                      iconSize: 30,
                      text: 'Info',
                    )
                  ],
                ),
                Text(
                  'Coming on $day $month',
                  style: fontSize,
                ),
                kHeight,
                Text(
                  movieName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: newAndHotTextStyle,
                ),
                kHeight,
                Text(
                  description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: greyColor),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
