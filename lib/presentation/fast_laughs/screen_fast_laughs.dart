import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/application/fastLaugh/fast_laughs_bloc.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/presentation/fast_laughs/widgets/video_list_item.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughsBloc>(context).add(const Initialize());
    });
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: BlocBuilder<FastLaughsBloc, FastLaughsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            } else if (state.isError) {
              return const Center(
                child: Text('Error While getting Data'),
              );
            } else if (state.videosLis.isEmpty) {
              return const Center(
                child: Text('VideoList empty'),
              );
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                  state.videosLis.length,
                  (index) => VideoListItemInheritedWidget(
                    widget: VideoListItem(
                      index: index,
                      key: Key(
                        index.toString(),
                      ),
                    ),
                    movieData: state.videosLis[index],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
