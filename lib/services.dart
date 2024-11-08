import 'package:http/http.dart' as http;
import 'package:movie_flutter/models/movie.dart';

Future<Movie> getNowPlayingMovies() async {
  final response = await http
      .get(Uri.https('api.themoviedb.org', '3/movie/now_playing'), headers: {
    'accept': 'application/json',
    'authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNzQ5MzU1ZTQ2Y2EzNjM2OTQwMjhhNDIzOTIxOWZhOSIsIm5iZiI6MTczMDgyNzA0Mi45MjE2NjU0LCJzdWIiOiI1ZGQ5NTMwYzEyYWFiYzAwMTE5MTA2ODYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.CX3mWQJAHEzdgUO33FVk2ux3S2sLjsW3Gfo1S3fZt50'
  });

  if (response.statusCode == 200) {
    return movieFromJson(response.body);
  } else {
    throw Exception('Failed to get now playing movies');
  }
}
