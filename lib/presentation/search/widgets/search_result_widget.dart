import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/application/search/search_bloc.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/presentation/widget/title.dart';
import 'package:netflixapp/presentation/widget/main_card.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(
          title: 'Movies & TV',
        ),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1 / 2,
                children: List.generate(20, (index) {
                  final movie = state.searchResultList[index];
                  return MainCardWidget(
                    listImageUrl: movie.posterImageUrl,
                  );
                }),
              );
            },
          ),
        )
      ],
    );
  }
}
