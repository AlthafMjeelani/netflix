import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflixapp/application/hotnadnew/hot_and_new_bloc.dart';
import 'package:netflixapp/core/string_constent.dart';
import 'package:netflixapp/presentation/new_and_hot/widget/listview_coming_soon.dart';

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoaddataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoaddataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text('Error While getting Data'),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text('VideoList empty'),
            );
          } else {
            return ListView.builder(
                itemCount: state.comingSoonList.length,
                itemBuilder: (context, index) {
                  final movie = state.comingSoonList[index];

                  if (movie.id == null) {
                    return const SizedBox();
                  }

                  String month = '';
                  String day = '';

                  try {
                    final date = DateTime.tryParse(movie.releaseDate!);
                    final formatedDate =
                        DateFormat.yMMMMd('en_US').format(date!);
                    log(formatedDate);
                    month = formatedDate.split(' ').first.substring(0, 3);
                    day = movie.releaseDate!.split('-')[1];
                  } catch (e) {
                    month = '';
                    day = '';
                  }

                  return NewAndHotComingSoonWidget(
                      index: index,
                      id: movie.id.toString(),
                      month: month,
                      day: day,
                      posterpath: '$kAppendImageUrl${movie.posterPath}',
                      movieName: movie.originalTitle ?? 'No Title',
                      description: movie.overview ?? "NO Description");
                });
          }
        },
      ),
    );
  }
}
