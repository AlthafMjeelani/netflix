import 'package:flutter/cupertino.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    Key? key,
    this.height,
    this.width,
    required this.listImageUrl,
  }) : super(key: key);
  final double? width;
  final double? height;
  final String listImageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(listImageUrl),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
