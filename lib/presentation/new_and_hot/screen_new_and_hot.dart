import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflixapp/application/hotnadnew/hot_and_new_bloc.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/core/string_constent.dart';
import 'package:netflixapp/presentation/new_and_hot/coming_soon_list.dart';
import 'package:netflixapp/presentation/new_and_hot/widget/listview_coming_soon.dart';
import 'package:netflixapp/presentation/new_and_hot/widget/listview_everyone_watching.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoaddataInComingSoon());
    });
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              title: Text(
                'New & Hot',
                style: appbarTextStyle,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cast,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  color: Colors.blue,
                ),
              ],
              bottom: TabBar(
                isScrollable: true,
                labelColor: blackColorText,
                unselectedLabelColor: whiteColorText,
                labelStyle: tabBarTextstyle,
                padding: const EdgeInsets.all(5),
                indicator: BoxDecoration(
                    color: whiteColorText, borderRadius: borderradius30),
                tabs: const [
                  Tab(
                    text: '🍿 Comming Soon',
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  )
                ],
              ),
            ),
          ),
          backgroundColor: backgroundcolor,
          body: SafeArea(
            child: TabBarView(
              children: [
                const ComingSoonList(
                  key: Key('Coming_Soon'),
                ),
                _buildEveryoneWatching(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEveryoneWatching() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const SizedBox();
      },
      itemCount: 10,
    );
  }
}
