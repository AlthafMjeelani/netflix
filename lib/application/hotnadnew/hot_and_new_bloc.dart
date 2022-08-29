import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixapp/core/failiurs/main_failures.dart';
import 'package:netflixapp/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflixapp/domain/hot_and_new/model/hot_and_new.dart';
part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService hotAndNewService;
  HotAndNewBloc(
    this.hotAndNewService,
  ) : super(HotAndNewState.initial()) {
    /*
    get hot and new movie data
     */
    on<LoaddataInComingSoon>(
      (event, emit) async {
        /*
   snd loading to ui
     */

        emit(
          const HotAndNewState(
            comingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: true,
            hasError: false,
          ),
        );

        // get data from remote
        final result = await hotAndNewService.getHotAndNewMovieData();

        // data to state
        final newState = result.fold(
          (MainFailures failure) {
            return const HotAndNewState(
              comingSoonList: [],
              everyOneIsWatchingList: [],
              isLoading: true,
              hasError: false,
            );
          },
          (HotAndNewRepo response) {
            return HotAndNewState(
              comingSoonList: response.results,
              everyOneIsWatchingList: state.everyOneIsWatchingList,
              isLoading: false,
              hasError: false,
            );
          },
        );

        emit(newState);
      },
    );

    /*
    get hot and new tv data
     */
    on<LoaddataInEveryOneIsWatching>(
      (event, emit) async {
        emit(
          const HotAndNewState(
            comingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: true,
            hasError: false,
          ),
        );

        // get data from remote
        final results = await hotAndNewService.getHotAndNewTvData();

        // data to state
        final newState = results.fold(
          (MainFailures failure) {
            return const HotAndNewState(
              comingSoonList: [],
              everyOneIsWatchingList: [],
              isLoading: true,
              hasError: false,
            );
          },
          (HotAndNewRepo response) {
            log(response.results.toString());
            return HotAndNewState(
              comingSoonList: state.comingSoonList,
              everyOneIsWatchingList: response.results,
              isLoading: false,
              hasError: false,
            );
          },
        );

        emit(newState);
      },
    );
  }
}
