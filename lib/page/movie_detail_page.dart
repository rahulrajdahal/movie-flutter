import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_flutter/models/movie.dart';
import 'package:movie_flutter/size_config.dart';

class MovieDetailPage extends StatelessWidget {
  static const routeName = '/movie-details';

  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<Movie, Movie>;

    final movie = routeArgs.values.first;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Text(
            movie.title,
            style: const TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(24),
                          fontWeight: FontWeight.w700)),
                  Text(movie.overview,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.w400)),
                  SizedBox(height: getProportionateScreenHeight(25)),
                  RichText(
                    text: TextSpan(
                        text: "Release Date: ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: getProportionateScreenWidth(18)),
                        children: [
                          TextSpan(
                            text: DateFormat('dd MMM yyyy')
                                .format(movie.releaseDate),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: getProportionateScreenWidth(14)),
                          )
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Rating: ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: getProportionateScreenWidth(18)),
                        children: [
                          TextSpan(
                            text: "${movie.voteAverage}",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: getProportionateScreenWidth(14)),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Image.network(
              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
