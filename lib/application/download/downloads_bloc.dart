import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflixapp/core/failiurs/main_failures.dart';
import 'package:netflixapp/domain/downloads/i_downloads_repo.dart';
import 'package:netflixapp/domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadRepo _downloadsrepo;
  DownloadsBloc(this._downloadsrepo) : super(DownloadsState.inital()) {
    on<_GetDownloadsImage>(
      (event, emit) async {
        emit(
          state.copyWith(
            isLoading: true,
            downloadFailureOrSuccessOption: const None(),
          ),
        );
        final Either<MainFailures, List<Downloads>> downloadOption =
            await _downloadsrepo.getDownloadsImage();

        if (state.downloads.isNotEmpty) {
          // emit(
          //   DownloadsState(
          //     isLoading: false,
          //     downloads: state.downloads,
          //     downloadFailureOrSuccessOption: const None(),
          //   ),
          // );
          // return;
        }
        emit(
          downloadOption.fold(
            (failure) => state.copyWith(
              isLoading: false,
              downloadFailureOrSuccessOption: Some(
                Left(
                  failure,
                ),
              ),
            ),
            (success) => state.copyWith(
              isLoading: false,
              downloads: success,
              downloadFailureOrSuccessOption: Some(
                Right(
                  success,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
