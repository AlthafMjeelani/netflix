part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required bool isLoading,
    required List<SearchResultData> searchResultList,
    required List<Downloads> idleList,
    required bool isError,
  }) = _SearchState;

  factory SearchState.initialize() => const SearchState(
        isLoading: false,
        searchResultList: [],
        idleList: [],
        isError: false,
      );
}
