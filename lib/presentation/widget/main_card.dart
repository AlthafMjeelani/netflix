import 'package:flutter/cupertino.dart';
import 'package:netflixapp/presentation/search/widgets/search_result_widget.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: NetworkImage(resultimageUrl),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
