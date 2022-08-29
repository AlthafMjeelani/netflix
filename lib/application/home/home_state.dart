part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required List<HotAndNewData> pastYearMovieList,
    required List<HotAndNewData> trendingMovieList,
    required List<HotAndNewData> tensDramasMovieList,
    required List<HotAndNewData> southIndianMovieList,
    required List<HotAndNewData> trendingTvList,
    required bool isLoading,
    required bool hassError,
  }) = _Initial;

  factory HomeState.initial() => const HomeState(
      pastYearMovieList: [],
      trendingMovieList: [],
      tensDramasMovieList: [],
      southIndianMovieList: [],
      trendingTvList: [],
      isLoading: false,
      hassError: false);
}
