import 'package:bloc/bloc.dart';
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
  final IDownloadRepo downloadsService;
  final SearchService searchService;
  SearchBloc(this.downloadsService, this.searchService)
      : super(SearchState.initialize()) {
    //idlestate
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(
          SearchState(
            isLoading: false,
            searchResultList: [],
            idleList: state.idleList,
            isError: false,
          ),
        );
        return;
      }
      emit(
        const SearchState(
          isLoading: true,
          searchResultList: [],
          idleList: [],
          isError: false,
        ),
      );
      //get trending
      final result = await downloadsService.getDownloadsImage();
      final stateResult = result.fold(
        (MainFailures fail) {
          return const SearchState(
            isLoading: false,
            searchResultList: [],
            idleList: [],
            isError: true,
          );
        },
        (List<Downloads> list) {
          return SearchState(
            isLoading: false,
            searchResultList: [],
            idleList: list,
            isError: false,
          );
        },
      );
      //show to ui
      emit(stateResult);
    });

//searchresultstte
    on<SerchMovie>((event, emit) {
      // search call movie api

      searchService.serchMovies(movieQuery: event.movieQuery);

      //show to api
    });
  }
}
