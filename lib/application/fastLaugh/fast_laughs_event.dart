part of 'fast_laughs_bloc.dart';

@freezed
class FastLaughsEvent with _$FastLaughsEvent {
  const factory FastLaughsEvent.initialize() = Initialize;

  const factory FastLaughsEvent.likeVideo({
    required int id,
  }) = LikeVideo;

  const factory FastLaughsEvent.unlikeVideo({
    required int id,
  }) = UnlikeVideo;
}
