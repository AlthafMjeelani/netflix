import 'package:flutter/material.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/presentation/downloads/widgets/download_image_widget.dart';

class Sectiontwo extends StatelessWidget {
  Sectiontwo({Key? key}) : super(key: key);

  final imageList = [
    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qhRex189iu6Cs0dV7ahbuBaRgeK.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const FittedBox(
          child: Text(
            'Introducing Downloads for you',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        kHeight,
        const Text(
          '''we'll download a personised selection of movies and shows for you,so there's always something to watch on your device''',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
        SizedBox(
          width: size.width,
          height: size.width * 0.81,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  radius: size.width * 0.35,
                ),
              ),
              DownloadsImageWidget(
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 130, bottom: 20),
                angle: 15,
                size: Size(size.width * 0.45, size.width * 0.55),
              ),
              DownloadsImageWidget(
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 130, bottom: 20),
                angle: -15,
                size: Size(size.width * 0.45, size.width * 0.55),
              ),
              DownloadsImageWidget(
                imageList: imageList[2],
                margin: const EdgeInsets.only(left: 0),
                size: Size(size.width * 0.45, size.width * 0.6),
              )
            ],
          ),
        ),
      ],
    );
  }
}
