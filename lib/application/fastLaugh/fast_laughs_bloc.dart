import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixapp/domain/downloads/i_downloads_repo.dart';
import 'package:netflixapp/domain/downloads/models/downloads.dart';

part 'fast_laughs_event.dart';
part 'fast_laughs_state.dart';
part 'fast_laughs_bloc.freezed.dart';

final videoUrls = [
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
];

@injectable
class FastLaughsBloc extends Bloc<FastLaughsEvent, FastLaughsState> {
  FastLaughsBloc(
    IDownloadRepo downloadService,
  ) : super(FastLaughsState.initial()) {
    on<Initialize>((event, emit) async {
      //sending loading to ui
      emit(const FastLaughsState(
        videosLis: [],
        isLoading: true,
        isError: false,
        likeVideosId: [],
      ));
      //trending  movies

      final result = await downloadService.getDownloadsImage();
      final laughsstate = result.fold((l) {
        return FastLaughsState(
          videosLis: [],
          isLoading: false,
          isError: true,
          likeVideosId: state.likeVideosId,
        );
      },
          (response) => FastLaughsState(
                videosLis: response,
                isLoading: false,
                isError: false,
                likeVideosId: state.likeVideosId,
              ));
      // send to ui

      emit(laughsstate);
    });

    on<LikeVideo>((event, emit) {
      final list = state.likeVideosId;
      list.add(event.id);
      emit(state.copyWith(likeVideosId: list));
    });

    on<UnlikeVideo>((event, emit) {
      final list = state.likeVideosId;
      list.remove(event.id);
      emit(state.copyWith(likeVideosId: list));
    });
  }
}
