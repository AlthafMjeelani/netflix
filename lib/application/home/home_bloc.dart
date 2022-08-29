import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
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
// send loading to ui
      emit(state.copyWith(isLoading: true, hassError: false));
      //get data

      final movieResult = await homeService.getHotAndNewMovieData();
      final tvResult = await homeService.getHotAndNewTvData();

      //transform data
    });
  }
}
