import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/application/bloc/downloads_bloc.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/core/string_constent.dart';
import 'package:netflixapp/presentation/widget/title.dart';
import 'package:netflixapp/presentation/search/widgets/top_searchloisttile.dart';

class ScreachIdleWidget extends StatelessWidget {
  const ScreachIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DownloadsBloc>(context)
        .add(const DownloadsEvent.getDownloadsImage());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return BlocBuilder<DownloadsBloc, DownloadsState>(
                builder: (context, state) {
                  return TopSearchListTile(
                    imageUrlsearch:
                        '$kAppendImageUrl${state.downloads[index].posterpath}',
                  );
                },
              );
            }),
            separatorBuilder: ((context, index) {
              return kHeight25;
            }),
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
