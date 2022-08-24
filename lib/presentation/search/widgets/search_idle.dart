import 'package:flutter/material.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/presentation/search/widgets/search_title.dart';
import 'package:netflixapp/presentation/search/widgets/top_searchloisttile.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w250_and_h141_face/l99dylTOAMkwKSr54X5ytiEtnLA.jpg';

class ScreachIdleWidget extends StatelessWidget {
  const ScreachIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitle(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return const TopSearchListTile();
            }),
            separatorBuilder: ((context, index) {
              return kHeight25;
            }),
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
