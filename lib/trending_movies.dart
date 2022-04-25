import 'package:flutter/material.dart';
import 'package:new_workout_app/colors.dart';
import 'package:new_workout_app/descirption.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  TrendingMovies({required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            'Trending movies',
            style: TextStyle(
              color: colorForText,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 275,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                name: trending[index]['title'],
                                description: trending[index]['overview'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path'],
                                vote:
                                    trending[index]['vote_average'].toString(),
                                launchOn: trending[index]['release_date'])));
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path'],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                            trending[index]['title'] != null
                                ? trending[index]['title']
                                : 'loading',
                            style: TextStyle(color: colorForText),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
