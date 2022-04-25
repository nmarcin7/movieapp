import 'package:flutter/material.dart';
import 'package:new_workout_app/colors.dart';
import 'descirption.dart';

class UpcomingMovies extends StatelessWidget {
  final List upcomingMov;
  UpcomingMovies({required this.upcomingMov});

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
            'Upcoming movies',
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
              itemCount: upcomingMov.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                name: upcomingMov[index]['title'],
                                description: upcomingMov[index]['overview'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    upcomingMov[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    upcomingMov[index]['poster_path'],
                                vote: upcomingMov[index]['vote_average']
                                    .toString(),
                                launchOn: upcomingMov[index]['release_date'])));
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    upcomingMov[index]['poster_path'],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                            upcomingMov[index]['title'] != null
                                ? upcomingMov[index]['title']
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
