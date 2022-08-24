import 'package:flutter/cupertino.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/presentation/search/widgets/search_title.dart';
import 'package:netflixapp/presentation/widget/main_card.dart';

const resultimageUrl =
    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitle(
          title: 'Movies & TV',
        ),
        kHeight,
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1 / 2,
            children: List.generate(
              20,
              (index) => const MainCardWidget(),
            ),
          ),
        )
      ],
    );
  }
}
