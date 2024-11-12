import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_flutter/models/movie.dart';
import 'package:movie_flutter/services.dart';
import 'package:movie_flutter/size_config.dart';
import 'package:movie_flutter/widgets/MovieCard.dart';

class TopRatedMovies extends StatefulWidget {
  const TopRatedMovies({super.key});

  @override
  State<TopRatedMovies> createState() => _TopRatedMovies();
}

class _TopRatedMovies extends State<TopRatedMovies> {
  late Future<TopRated> topRatedMovies;

  @override
  void initState() {
    super.initState();
    topRatedMovies = getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Rated',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: getProportionateScreenWidth(32)),
        ),
        FutureBuilder(
            future: topRatedMovies,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                debugPrint('${snapshot.error}');
                return const Text("Error Loading Movies");
              } else if (snapshot.hasData) {
                if (snapshot.data == null) {
                  return const Text("No Movies Found");
                } else {
                  return SizedBox(
                    height: getProportionateScreenHeight(400),
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse,
                            PointerDeviceKind.trackpad
                          }),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return MovieCard(
                                movie: snapshot.data!.results[index]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                                width: getProportionateScreenWidth(10));
                          },
                          itemCount: 10),
                    ),
                  );
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            })
      ],
    );
  }
}
