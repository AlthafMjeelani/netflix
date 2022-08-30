import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/application/home/home_bloc.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/core/string_constent.dart';
import 'package:netflixapp/presentation/home/widgets/background_card_widget.dart';
import 'package:netflixapp/presentation/home/widgets/main_title_card_widget.dart';
import 'package:netflixapp/presentation/home/widgets/number_widget.dart';
import 'package:netflixapp/presentation/widget/appbar_widget.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHomePage extends StatelessWidget {
  const ScreenHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(
        const GetHomeScreenData(),
      );
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HomeBloc>(context).add(
          const GetHomeScreenData(),
        );
      },
      child: Scaffold(
        backgroundColor: backgroundcolor,
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ValueListenableBuilder(
                  valueListenable: scrollNotifier,
                  builder: (context, bool value, _) {
                    return NotificationListener<UserScrollNotification>(
                      onNotification: (notification) {
                        final ScrollDirection direction =
                            notification.direction;
                        if (direction == ScrollDirection.reverse) {
                          scrollNotifier.value = false;
                        } else if (direction == ScrollDirection.forward) {
                          scrollNotifier.value = true;
                        }
                        return true;
                      },
                      child: Stack(
                        children: [
                          BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, state) {
                              if (state.isLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                );
                              } else if (state.hasError) {
                                return const Center(
                                  child: Text('Error While getting Data'),
                                );
                              } else if (state.pastYearMovieList.isEmpty) {
                                return const Center(
                                  child: Text('VideoList empty'),
                                );
                              }
                              //released past year
                              final releasedPastYear =
                                  state.pastYearMovieList.map((m) {
                                return '$kAppendImageUrl${m.posterPath}';
                              }).toList();
                              releasedPastYear.shuffle();

                              //trending now

                              final trendingNow =
                                  state.trendingMovieList.map((m) {
                                return '$kAppendImageUrl${m.posterPath}';
                              }).toList();
                              trendingNow.shuffle();

                              //tense dramas

                              final tensDramas =
                                  state.tensDramasMovieList.map((m) {
                                return '$kAppendImageUrl${m.posterPath}';
                              }).toList();
                              tensDramas.shuffle();

                              //southindian cinemas

                              final southIndian =
                                  state.southIndianMovieList.map((m) {
                                return '$kAppendImageUrl${m.posterPath}';
                              }).toList();
                              southIndian.shuffle();

                              //tv shows top 10 cinemas

                              final tvTopTen = state.trendingTvList.map((m) {
                                return '$kAppendImageUrl${m.posterPath}';
                              }).toList();

                              // bcakgroundcard

                              final backGroundCard =
                                  state.trendingTvList.map((m) {
                                return '$kAppendImageUrl${m.posterPath}';
                              }).toList();

                              return ListView(
                                children: [
                                  BackgroundcardWidget(
                                    backGroundImage: backGroundCard,
                                  ),
                                  MainTitleCardWidget(
                                    title: 'Released in the Past Year',
                                    posterList: releasedPastYear,
                                  ),
                                  kHeight,
                                  MainTitleCardWidget(
                                    title: 'Trending Now',
                                    posterList: trendingNow,
                                  ),
                                  NumberWidget(
                                    postersList: tvTopTen.sublist(0, 10),
                                  ),
                                  MainTitleCardWidget(
                                    title: 'Tense Dramas',
                                    posterList: tensDramas,
                                  ),
                                  MainTitleCardWidget(
                                    title: 'South Indian cinema',
                                    posterList: southIndian,
                                  ),
                                ],
                              );
                            },
                          ),
                          scrollNotifier.value == true
                              ? AnimatedContainer(
                                  duration: const Duration(microseconds: 1000),
                                  width: double.infinity,
                                  height: 100,
                                  color: Colors.black.withOpacity(0.3),
                                  child: Column(
                                    children: [
                                      AppbarWidget(
                                        title: Image.network(
                                          homepageImage[1],
                                          width: 70,
                                          height: 70,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: const [
                                          Text(
                                            'TV Shows',
                                            style: textstyle,
                                          ),
                                          Text(
                                            'Movies',
                                            style: textstyle,
                                          ),
                                          Text(
                                            'Categories',
                                            style: textstyle,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                    );
                  })),
        ),
      ),
    );
  }
}
