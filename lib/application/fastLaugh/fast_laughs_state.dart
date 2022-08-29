part of 'fast_laughs_bloc.dart';

@freezed
class FastLaughsState with _$FastLaughsState {
  const factory FastLaughsState({
    required List<Downloads> videosLis,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory FastLaughsState.initial() => FastLaughsState(
        isError: false,
        isLoading: true,
        videosLis: [],
      );
}
