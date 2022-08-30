import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/presentation/widget/main_card.dart';
import 'package:netflixapp/presentation/widget/title.dart';

class MainTitleCardWidget extends StatelessWidget {
  const MainTitleCardWidget({
    Key? key,
    required this.title,
    required this.posterList,
  }) : super(key: key);

  final String title;
  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(
          title: title,
        ),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return MainCardWidget(
                width: 150,
                listImageUrl: posterList[index],
              );
            },
            itemCount: posterList.length,
            separatorBuilder: (BuildContext context, int index) {
              return kwidth;
            },
          ),
        )
      ],
    );
  }
}
