import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/costents.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
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
          // bottom: TabBar(tabs: [
          //   Tab(
          //     text: '🍿 Comming Soon',
          //   ),
          //   Tab(
          //     text: '👀 everyOne is Watching',
          //   )
          // ]),
        ),
      ),
      backgroundColor: backgroundcolor,
      body: const SafeArea(
        child: Center(
          child: Text('Screen New And Hot'),
        ),
      ),
    );
  }
}
