import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixapp/core/failiurs/main_failures.dart';
import 'package:netflixapp/domain/downloads/i_downloads_repo.dart';
import 'package:netflixapp/domain/downloads/models/downloads.dart';
import 'package:netflixapp/domain/search/i_serch_repo.dart';
import 'package:netflixapp/domain/search/models/search_response/search_response.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadRepo downloadsFazard;
  final ISearchFazard searchFazard;
  SearchBloc(
    this.downloadsFazard,
    this.searchFazard,
  ) : super(SearchState.initial()) {
    //On Search Idle State
    on<Initialize>((event, emit) async {
      if (state.searchIdleList.isNotEmpty) {
        emit(state.copyWith(
          searchIdleList: state.searchIdleList,
          searchResultList: [],
          isLoading: false,
          isError: false,
        ));
        return;
      }
      //Showing loading for initial condition
      emit(
        state.copyWith(
          searchIdleList: [],
          searchResultList: [],
          isLoading: true,
          isError: false,
        ),
      );
      // get trending movies list from list of downloads
      final idleSearchState = await downloadsFazard.getDownloadsImage();
      idleSearchState.fold(
        (MainFailures failure) {
          emit(
            state.copyWith(
              searchIdleList: [],
              searchResultList: [],
              isLoading: false,
              isError: true,
            ),
          );
        },
        (List<Downloads> success) {
          emit(
            state.copyWith(
              searchIdleList: success,
              searchResultList: [],
              isLoading: false,
              isError: false,
            ),
          );
        },
      );
      emit(state);
    });

    //On Search result state
    on<SearchMovie>(
      (event, emit) async {
        emit(
          state.copyWith(
            searchIdleList: [],
            searchResultList: [],
            isLoading: true,
            isError: false,
          ),
        );
        log('searching for ${event.movieQuery}');
        // call search movie API
        final searchResultState =
            await searchFazard.getSearchMovies(movieQuery: event.movieQuery);
        print(searchResultState);

        searchResultState.fold(
          (MainFailures failure) {
            emit(
              state.copyWith(
                searchIdleList: [],
                searchResultList: [],
                isLoading: false,
                isError: true,
              ),
            );
          },
          (SearchResponse success) {
            emit(
              state.copyWith(
                searchIdleList: [],
                searchResultList: success.results,
                isLoading: false,
                isError: true,
              ),
            );
          },
        );
      },
    );
  }
}
