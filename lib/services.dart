import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movie_flutter/models/movie.dart';

Future<NowPlaying> getNowPlayingMovies() async {
  final response = await http.get(
      Uri.https(dotenv.env['MOVIE_URL']!, '3/movie/now_playing'),
      headers: {
        'accept': 'application/json',
        'authorization': "Bearer ${dotenv.env['MOVIE_API_KEY']}"
      });

  if (response.statusCode == 200) {
    return nowPlayingFromJson(response.body);
  } else {
    throw Exception('Failed to get now playing movies');
  }
}

Future<TopRated> getTopRatedMovies() async {
  final response = await http
      .get(Uri.https(dotenv.env['MOVIE_URL']!, '3/movie/top_rated'), headers: {
    'accept': 'application/json',
    'authorization': "Bearer ${dotenv.env['MOVIE_API_KEY']}"
  });

  if (response.statusCode == 200) {
    return topRatedFromJson(response.body);
  } else {
    throw Exception('Failed to get top rated movies');
  }
}
