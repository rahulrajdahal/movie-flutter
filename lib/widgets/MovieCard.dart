import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_flutter/models/movie.dart';
import 'package:movie_flutter/page/movie_detail_page.dart';

class MovieCard extends StatelessWidget {
  final Result movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MovieDetailPage.routeName, arguments: {movie: movie});
      },
      child: SizedBox(
          width: 250,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
            Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            RichText(
              text: TextSpan(
                  text: 'Release Date: ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16),
                  children: [
                    TextSpan(
                      text: DateFormat('dd MMM yyyy').format(movie.releaseDate),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ]),
            ),
            RichText(
              text: TextSpan(
                  text: 'Rating: ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16),
                  children: [
                    TextSpan(
                      text: '${movie.voteAverage}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ]),
            ),
          ])),
    );
  }
}
