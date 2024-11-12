import 'package:flutter/material.dart';
import 'package:movie_flutter/size_config.dart';
import 'package:movie_flutter/widgets/NowPlayingMovies.dart';
import 'package:movie_flutter/widgets/TopRatedMovies.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
          child: Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(8.0)),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                NowPlayingMovies(),
                TopRatedMovies(),
              ],
            ),
          ),
        ));
  }
}
