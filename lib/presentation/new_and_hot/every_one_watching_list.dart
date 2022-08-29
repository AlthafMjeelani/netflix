import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/application/hotnadnew/hot_and_new_bloc.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/string_constent.dart';
import 'package:netflixapp/presentation/new_and_hot/widget/listview_everyone_watching.dart';

class EveryOneIsWatchingList extends StatelessWidget {
  const EveryOneIsWatchingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoaddataInEveryOneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoaddataInEveryOneIsWatching());
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
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return const Center(
              child: Text('List empty'),
            );
          } else {
            return ListView.separated(
              itemCount: state.everyOneIsWatchingList.length,
              itemBuilder: (context, index) {
                final tv = state.everyOneIsWatchingList[index];
                return EveryonesWatchingWidget(
                    posterpath: '$kAppendImageUrl${tv.posterPath}',
                    movieName: tv.originalName ?? "No Name",
                    description: tv.overview ?? 'No Descreption');
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1,
                  color: whiteColorText,
                );
              },
            );
          }
        },
      ),
    );
  }
}
