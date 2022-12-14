import 'package:flutter/material.dart';
import 'package:netflixapp/presentation/home/widgets/number_card.dart';
import 'package:netflixapp/presentation/widget/title.dart';

import '../../../core/costents.dart';

class NumberWidget extends StatelessWidget {
  const NumberWidget({
    Key? key,
    required this.postersList,
  }) : super(key: key);

  final List<String> postersList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FittedBox(
          child: TitleWidget(
            title: 'Top 10 TV Shows in India Today',
          ),
        ),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return NumberCardWidget(
                width: 150,
                listImageUrl: postersList[index],
                index: index,
              );
            },
            itemCount: postersList.length,
            separatorBuilder: (BuildContext context, int index) {
              return kwidth;
            },
          ),
        )
      ],
    );
  }
}
