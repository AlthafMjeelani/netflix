import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixapp/application/download/downloads_bloc.dart';
import 'package:netflixapp/application/fastLaugh/fast_laughs_bloc.dart';
import 'package:netflixapp/application/home/home_bloc.dart';
import 'package:netflixapp/application/hotnadnew/hot_and_new_bloc.dart';
import 'package:netflixapp/application/search/search_bloc.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/domain/core/di/injectable.dart';
import 'package:netflixapp/presentation/mainpage/widget/screen_main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configerInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getit<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getit<SearchBloc>()),
        BlocProvider(create: (ctx) => getit<FastLaughsBloc>()),
        BlocProvider(create: (ctx) => getit<HotAndNewBloc>()),
        BlocProvider(create: (ctx) => getit<HomeBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          backgroundColor: backgroundcolor,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          ),
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}
