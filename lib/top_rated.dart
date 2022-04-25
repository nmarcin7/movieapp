import 'package:flutter/material.dart';
import 'package:new_workout_app/colors.dart';
import 'descirption.dart';

class TopRatedVideos extends StatelessWidget {
  final List topRatedVids;
  TopRatedVideos({required this.topRatedVids});

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
            'Top Rated movies',
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
              itemCount: topRatedVids.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                name: topRatedVids[index]['title'],
                                description: topRatedVids[index]['overview'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    topRatedVids[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    topRatedVids[index]['poster_path'],
                                vote: topRatedVids[index]['vote_average']
                                    .toString(),
                                launchOn: topRatedVids[index]
                                    ['release_date'])));
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
                                    topRatedVids[index]['poster_path'],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                            topRatedVids[index]['title'] != null
                                ? topRatedVids[index]['title']
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
