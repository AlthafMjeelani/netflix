part of 'downloads_bloc.dart';

@freezed
class DownloadState with _$DownloadState {
  const factory DownloadState(
      {required bool isLoading,
      List<Downloads>? downloads,
      required Option<Either<DownloadsFailures, List<Downloads>>>
          downloadFailureOrSuccessOption}) = _DownloadState;

  factory DownloadState.inital() {
    return const DownloadState(
      isLoading: false,
      downloadFailureOrSuccessOption: None(),
    );
  }
}
