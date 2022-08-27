import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/application/download/downloads_bloc.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/core/string_constent.dart';
import 'package:netflixapp/presentation/downloads/widgets/download_image_widget.dart';

class Sectiontwo extends StatelessWidget {
  const Sectiontwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
    // BlocProvider.of<DownloadsBloc>(context)
    //     .add(const DownloadsEvent.getDownloadsImage());
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
        kHeight25,
        const Text(
          '''we'll download a personised selection of movies and shows for you,so there's always something to watch on your device''',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
        kHeight25,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width * 0.81,
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            radius: size.width * 0.35,
                          ),
                        ),
                        DownloadsImageWidget(
                          imageList:
                              '$kAppendImageUrl${state.downloads[0].posterpath}',
                          margin: const EdgeInsets.only(left: 130, bottom: 20),
                          angle: 15,
                          size: Size(size.width * 0.45, size.width * 0.55),
                        ),
                        DownloadsImageWidget(
                          imageList:
                              '$kAppendImageUrl${state.downloads[1].posterpath}',
                          margin: const EdgeInsets.only(right: 130, bottom: 20),
                          angle: -15,
                          size: Size(size.width * 0.45, size.width * 0.55),
                        ),
                        DownloadsImageWidget(
                          imageList:
                              '$kAppendImageUrl${state.downloads[2].posterpath}',
                          margin: const EdgeInsets.only(left: 0),
                          size: Size(size.width * 0.45, size.width * 0.6),
                        )
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}
