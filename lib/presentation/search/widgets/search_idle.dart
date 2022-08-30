import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/application/search/search_bloc.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/core/string_constent.dart';
import 'package:netflixapp/presentation/widget/title.dart';
import 'package:netflixapp/presentation/search/widgets/top_searchloisttile.dart';

class ScreachIdleWidget extends StatelessWidget {
  const ScreachIdleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child:
              BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.isError) {
              return const Center(
                child: Text('Error while getting data'),
              );
            } else if (state.searchIdleList.isEmpty) {
              return const Center(
                child: Text('List is Empty'),
              );
            }
            return ListView.separated(
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                final moviename = state.searchIdleList[index];
                return TopSearchListTile(
                    title: moviename.title ?? 'No Title',
                    imageUrl: '$kAppendImageUrl${moviename.posterpath}');
              }),
              separatorBuilder: ((context, index) {
                return kHeight25;
              }),
              itemCount: state.searchIdleList.length,
            );
          }),
        )
      ],
    );
  }
}
