import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/presentation/downloads/screen_downloads.dart';
import 'package:netflixapp/presentation/fast_laughs/screen_fast_laughs.dart';
import 'package:netflixapp/presentation/home/screen_home.dart';
import 'package:netflixapp/presentation/mainpage/widget/screen_bottomnavigation.dart';
import 'package:netflixapp/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflixapp/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final pages = [
    const ScreenHomePage(),
    const ScreenNewAndHot(),
    const ScreenFastLaughs(),
    ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: ValueListenableBuilder(
          valueListenable: indexNotifire,
          builder: (BuildContext context, int index, _) {
            return pages[index];
          }),
      bottomNavigationBar: const ScreenBottomNavigation(),
    );
  }
}
