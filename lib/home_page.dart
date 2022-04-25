import 'package:flutter/material.dart';
import 'package:new_workout_app/upcoming_movies.dart';
import 'package:new_workout_app/bottom_navigation_bar.dart';
import 'package:new_workout_app/top_rated.dart';
import 'package:new_workout_app/trending_movies.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'colors.dart';
import 'top_rated.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List upcomingMovies = [];
  final String _token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZTM1NDIwOTc0YmNhZmU2MTE0ODE1MDU2OTVmZTExNCIsInN1YiI6IjYyMDI0MzM5OTY2NzBlMDA0MzlhNTc3OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YRpFpXJcxx4pcCxHQZayQzLRSh6l7Jfjf9dXpSS47ZU';
  final String _apikey = 'ee35420974bcafe611481505695fe114';

  @override
  void initState() {
    getMovies();
    super.initState();
  }

  getMovies() async {
    TMDB tmdbCustomLogs = TMDB(ApiKeys(_apikey, _token),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingResult = await tmdbCustomLogs.v3.trending.getTrending();
    Map topRatedMoviesResult = await tmdbCustomLogs.v3.movies.getTopRated();
    Map upcomingMoviesResults = await tmdbCustomLogs.v3.movies.getUpcoming();

    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedMoviesResult['results'];
      upcomingMovies = upcomingMoviesResults['results'];
    });

    print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const BottomNavBar(),
      backgroundColor: colorForBackground,
      // appBar: AppBar(
      //   title: Text('Flutter movie app'),
      //   centerTitle: true,
      // ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          TrendingMovies(
            trending: trendingMovies,
          ),
          UpcomingMovies(
            upcomingMov: upcomingMovies,
          ),
          TopRatedVideos(topRatedVids: topRatedMovies),
        ],
      ),
    );
  }
}
