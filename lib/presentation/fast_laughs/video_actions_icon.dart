import 'package:flutter/cupertino.dart';
import 'package:netflixapp/core/colors/colors.dart';

class VideoActionIcons extends StatelessWidget {
  const VideoActionIcons({
    Key? key,
    required this.head,
    required this.sub,
  }) : super(key: key);

  final IconData head;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Icon(
            head,
            color: whiteColorText,
            size: 30,
          ),
          Text(
            sub,
            style: const TextStyle(
              color: whiteColorText,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
