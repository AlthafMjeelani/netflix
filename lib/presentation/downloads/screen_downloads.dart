import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/presentation/downloads/widgets/section_one.dart';
import 'package:netflixapp/presentation/downloads/widgets/section_three.dart';
import 'package:netflixapp/presentation/downloads/widgets/section_two.dart';
import 'package:netflixapp/presentation/widget/appbar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final _widget = [
    const SectionOne(),
    const Sectiontwo(),
    const ScectionThree(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundcolor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppbarWidget(
            title: Text(
              'Downloads',
              style: appbarTextStyle,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return _widget[index];
            },
            itemCount: _widget.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 30,
              );
            },
          ),
        ),
      ),
    );
  }
}
