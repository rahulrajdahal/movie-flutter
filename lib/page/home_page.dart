import 'package:flutter/material.dart';
import 'package:movie_flutter/models/movie.dart';
import 'package:movie_flutter/services.dart';
import 'package:movie_flutter/widgets/MovieCard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Movie> nowPlayingMovies;

  @override
  void initState() {
    super.initState();

    nowPlayingMovies = getNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Movie App",
                style: TextStyle(color: Colors.white),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                  future: nowPlayingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Error Loading Movies");
                    } else if (snapshot.hasData) {
                      if (snapshot.data == null) {
                        return const Text("No Movies Found");
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Now Playing',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 32),
                            ),
                            SizedBox(
                                height: 450,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return MovieCard(
                                          movie: snapshot.data!.results[index]);
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(width: 10);
                                    },
                                    itemCount: 10))
                          ],
                        );
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
              const SizedBox(height: 20),
              FutureBuilder(
                  future: nowPlayingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Error Loading Movies");
                    } else if (snapshot.hasData) {
                      if (snapshot.data == null) {
                        return const Text("No Movies Found");
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Top Rated',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 32),
                            ),
                            SizedBox(
                              height: 500,
                              child: ListView.separated(
                                  addRepaintBoundaries: true,
                                  itemCount: snapshot.data!.results.length,
                                  itemBuilder: (context, index) {
                                    return MovieCard(
                                        movie: snapshot.data!.results[index]);
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider();
                                  }),
                            )
                          ],
                        );
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ],
          ),
        ));
  }
}
