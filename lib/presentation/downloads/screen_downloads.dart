import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/presentation/widget/appbar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundcolor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50), child: AppbarWidget()),
      body: SafeArea(
        child: Center(
          child: Text('Screen Downloads'),
        ),
      ),
    );
  }
}
