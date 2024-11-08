import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_flutter/page/home_page.dart';
import 'package:movie_flutter/page/movie_detail_page.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(MaterialApp(
    title: 'Movie App',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const MyHomePage(),
    routes: {MovieDetailPage.routeName: (context) => MovieDetailPage()},
  ));
}
