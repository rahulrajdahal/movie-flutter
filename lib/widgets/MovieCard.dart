import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_flutter/models/movie.dart';
import 'package:movie_flutter/page/movie_detail_page.dart';
import 'package:movie_flutter/size_config.dart';

Route _createRoute(Movie movie) {
  return PageRouteBuilder(
    settings: RouteSettings(arguments: {movie: movie}),
    pageBuilder: (context, animation, secondaryAnimation) =>
        const MovieDetailPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final _animation =
          CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn);

      return ScaleTransition(
        scale: _animation,
        child: child,
      );
    },
  );
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(_createRoute(movie));
        // Navigator.of(context)
        //     .pushNamed(MovieDetailPage.routeName, arguments: {movie: movie});
      },
      child: SizedBox(
          width: getProportionateScreenWidth(180),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(getProportionateScreenWidth(20)),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                fit: BoxFit.cover,
                height: getProportionateScreenHeight(300),
              ),
            ),
            Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: getProportionateScreenWidth(20),
              ),
            ),
            RichText(
              text: TextSpan(
                  text: 'Release Date: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(16)),
                  children: [
                    TextSpan(
                      text: DateFormat('dd/MM/yyyy').format(movie.releaseDate),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: getProportionateScreenWidth(14)),
                    ),
                  ]),
            ),
            RichText(
              text: TextSpan(
                  text: 'Rating: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(16)),
                  children: [
                    TextSpan(
                      text: '${movie.voteAverage}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: getProportionateScreenWidth(14)),
                    ),
                  ]),
            ),
          ])),
    );
  }
}
