import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/application/search/search_bloc.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/domain/core/dbouncer/dbouncer.dart';
import 'package:netflixapp/presentation/search/widgets/search_result_widget.dart';

import 'widgets/search_idle.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({Key? key}) : super(key: key);

  final _debouncer = Debouncer(milliseconds: 1 * 1000);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(
        const SearchEvent.initialize(),
      );
    });
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(0.5),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: whiteColorText),
                onChanged: (value) {
                  _debouncer.run(() {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SerchMovie(movieQuery: value));
                  });
                },
              ),
              kHeight25,
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state.searchResultList.isEmpty) {
                      return const ScreachIdleWidget();
                    }
                    return const SearchResultWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
