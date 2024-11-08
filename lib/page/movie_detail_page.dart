import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_flutter/models/movie.dart';

class MovieDetailPage extends StatelessWidget {
  static const routeName = '/movie-details';

  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<Result, Result>;

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
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700)),
                  Text(movie.overview,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                  const SizedBox(height: 25),
                  RichText(
                    text: TextSpan(
                        text: "Release Date: ",
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 18),
                        children: [
                          TextSpan(
                            text: DateFormat('dd MMM yyyy')
                                .format(movie.releaseDate),
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          )
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Rating: ",
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 18),
                        children: [
                          TextSpan(
                            text: "${movie.voteAverage}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
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
