import 'package:flutter/material.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/presentation/fast_laughs/video_actions_icon.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
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
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg'),
                    ),
                    kHeight25,
                    VideoActionIcons(
                      head: Icons.emoji_emotions,
                      sub: 'LOL',
                    ),
                    kHeight25,
                    VideoActionIcons(
                      head: Icons.add,
                      sub: 'My list',
                    ),
                    kHeight25,
                    VideoActionIcons(
                      head: Icons.share,
                      sub: 'Share',
                    ),
                    kHeight25,
                    VideoActionIcons(
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
