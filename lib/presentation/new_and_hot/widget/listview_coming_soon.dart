import 'package:flutter/material.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/presentation/home/widgets/custom_button.dart';
import 'package:netflixapp/presentation/search/widgets/video_card_widget.dart';

import '../../../core/colors/colors.dart';

class NewAndHotComingSoonWidget extends StatelessWidget {
  const NewAndHotComingSoonWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Feb',
                style: TextStyle(
                  color: greyColor,
                ),
              ),
              Text(
                '${index + 11}',
                style: appbarTextStyle,
              )
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 450,
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NewAndHoteCardWidget(),
                kHeight,
                Row(
                  children: [
                    Text(
                      'TALL GIRL 2',
                      style: newAndHotTextStyle,
                    ),
                    const Spacer(),
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
                  'Coming on Friday',
                  style: fontSize,
                ),
                kHeight,
                Text(
                  'Tall Girl 2',
                  style: newAndHotTextStyle,
                ),
                kHeight,
                const Text(
                  'Landing the lead in the school musical is a\ndream come true for jodi uniol the pressure\nsends her cofidence - and her relationship-\ninto a tailspin',
                  style: TextStyle(color: greyColor),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
