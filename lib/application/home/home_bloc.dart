import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixapp/core/failiurs/main_failures.dart';
import 'package:netflixapp/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflixapp/domain/hot_and_new/model/hot_and_new.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService homeService;

  HomeBloc(this.homeService) : super(HomeState.initial()) {
    // on get home screen data
    on<GetHomeScreenData>((event, emit) async {
      log('getting home screen');
      // send loading to ui
      emit(state.copyWith(isLoading: true, hasError: false));
      //get data

      final movieResult = await homeService.getHotAndNewMovieData();
      final tvResult = await homeService.getHotAndNewTvData();

      //transform data
      final stateOne = movieResult.fold(
        (MainFailures failure) {
          return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tensDramasMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewRepo response) {
          final pastYear = response.results;
          pastYear.shuffle();

          final trending = response.results;
          trending.shuffle();
          final tensDramas = response.results;
          tensDramas.shuffle();
          final southIndian = response.results;
          southIndian.shuffle;
          return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear,
            trendingMovieList: trending,
            tensDramasMovieList: tensDramas,
            southIndianMovieList: southIndian,
            trendingTvList: state.trendingTvList,
            isLoading: false,
            hasError: false,
          );
        },
      );

      // send to ui
      emit(stateOne);

      //second section
      final stateTwo = tvResult.fold(
        (MainFailures failure) {
          return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tensDramasMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewRepo response) {
          final toptenList = response.results;
          toptenList.shuffle();
          return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: state.trendingMovieList,
            tensDramasMovieList: state.tensDramasMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingTvList: toptenList,
            isLoading: false,
            hasError: false,
          );
        },
      );

      // send to ui
      emit(stateTwo);
    });
  }
}
