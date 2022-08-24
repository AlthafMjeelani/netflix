import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflixapp/core/colors/colors.dart';

class ScreachIdleWidget extends StatelessWidget {
  const ScreachIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
          child: Column(
        children: [CupertinoSearchTextField()],
      )),
    );
  }
}
