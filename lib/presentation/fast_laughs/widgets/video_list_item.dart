import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/application/fastLaugh/fast_laughs_bloc.dart';
import 'package:netflixapp/application/fastLaugh/fast_laughs_bloc.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/core/string_constent.dart';
import 'package:netflixapp/domain/downloads/models/downloads.dart';
import 'package:netflixapp/presentation/fast_laughs/video_actions_icon.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget({
    Key? key,
    required this.widget,
    required this.movieData,
  }) : super(
          key: key,
          child: widget,
        );

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postalPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterpath;

    final videoUrl = videoUrls[index % videoUrls.length];
    return Stack(
      children: [
        FastLaughsVideoPlayer(videoUrl: videoUrl, onStateChanged: (bool) {}),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_off_outlined,
                    size: 30,
                    color: whiteColorText,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: postalPath == null
                          ? null
                          : NetworkImage('$kAppendImageUrl$postalPath'),
                    ),
                    kHeight25,
                    BlocBuilder<FastLaughsBloc, FastLaughsState>(
                      builder: (context, state) {
                        final likedIndex = index;

                        if (state.likeVideosId.contains(likedIndex)) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<FastLaughsBloc>(context)
                                  .add(UnlikeVideo(id: likedIndex));
                            },
                            child: const VideoActionIcons(
                              head: Icons.favorite,
                              sub: 'LOL',
                            ),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<FastLaughsBloc>(context)
                                  .add(LikeVideo(id: likedIndex));
                            },
                            child: const VideoActionIcons(
                              head: Icons.emoji_emotions,
                              sub: 'LOL',
                            ),
                          );
                        }
                      },
                    ),
                    kHeight25,
                    const VideoActionIcons(
                      head: Icons.add,
                      sub: 'My list',
                    ),
                    kHeight25,
                    GestureDetector(
                      onTap: () {
                        final movieName =
                            VideoListItemInheritedWidget.of(context)
                                    ?.movieData
                                    .posterpath ??
                                '';

                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                      child: const VideoActionIcons(
                        head: Icons.share,
                        sub: 'Share',
                      ),
                    ),
                    kHeight25,
                    const VideoActionIcons(
                      head: Icons.play_arrow,
                      sub: 'Play',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FastLaughsVideoPlayer extends StatefulWidget {
  final String videoUrl;

  final void Function(bool isPlaying) onStateChanged;
  const FastLaughsVideoPlayer({
    Key? key,
    required this.videoUrl,
    required this.onStateChanged,
  }) : super(key: key);

  @override
  State<FastLaughsVideoPlayer> createState() => _FastLaughsVideoPlayerState();
}

class _FastLaughsVideoPlayerState extends State<FastLaughsVideoPlayer> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    videoPlayerController.initialize().then((value) {
      setState(() {
        videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: videoPlayerController.value.aspectRatio,
              child: VideoPlayer(videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}
