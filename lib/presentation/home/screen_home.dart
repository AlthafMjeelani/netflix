import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/presentation/home/widgets/main_title_card_widget.dart';
import 'package:netflixapp/presentation/home/widgets/number_card.dart';
import 'package:netflixapp/presentation/widget/main_card.dart';
import 'package:netflixapp/presentation/widget/title.dart';

const homepageImage = [
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ekZobS8isE6mA53RAiGDG93hBxL.jpg',
  'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/KoYWXbnYuS3b0GyQPkbuexlVK9.jpg',
  'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/hJfI6AGrmr4uSHRccfJuSsapvOb.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/rJHC1RUORuUhtfNb4Npclx0xnOf.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/xf9wuDcqlUPWABZNeDKPbZUjWx0.jpg',
];

class ScreenHomePage extends StatelessWidget {
  const ScreenHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainTitleCardWidget(
                title: 'Released in the Past Year',
                url: homepageImage[0],
              ),
              kHeight,
              MainTitleCardWidget(
                title: 'Trending Now',
                url: homepageImage[1],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
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
                          listImageUrl: homepageImage[4],
                        );
                      },
                      itemCount: 10,
                      separatorBuilder: (BuildContext context, int index) {
                        return kwidth;
                      },
                    ),
                  )
                ],
              ),
              MainTitleCardWidget(
                title: 'Tense Dramas',
                url: homepageImage[2],
              ),
              MainTitleCardWidget(
                title: 'South Indian cinema',
                url: homepageImage[3],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
