import 'package:flutter/material.dart';
import 'package:movie_flutter/models/movie.dart';
import 'package:movie_flutter/services.dart';
import 'package:movie_flutter/size_config.dart';
import 'package:movie_flutter/widgets/MovieCard.dart';

class NowPlayingMovies extends StatefulWidget {
  const NowPlayingMovies({super.key});

  @override
  State<NowPlayingMovies> createState() => _NowPlayingMoviesState();
}

class _NowPlayingMoviesState extends State<NowPlayingMovies> {
  late Future<NowPlaying> nowPlayingMovies;

  @override
  void initState() {
    super.initState();
    nowPlayingMovies = getNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Now Playing',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: getProportionateScreenWidth(32)),
        ),
        FutureBuilder(
            future: nowPlayingMovies,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Error Loading Movies");
              } else if (snapshot.hasData) {
                if (snapshot.data == null) {
                  return const Text("No Movies Found");
                } else {
                  return SizedBox(
                    height: getProportionateScreenHeight(400),
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
