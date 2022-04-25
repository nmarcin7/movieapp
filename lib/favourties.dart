import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_workout_app/colors.dart';

class FavourtiesMovies extends StatefulWidget {
  const FavourtiesMovies({Key? key}) : super(key: key);

  @override
  _FavourtiesMoviesState createState() => _FavourtiesMoviesState();
}

class _FavourtiesMoviesState extends State<FavourtiesMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of your favourties movies'),
      ),
      backgroundColor: colorForBackground,
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'movie name',
                  style: TextStyle(color: colorForText, fontSize: 20),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
