import 'package:flutter/material.dart';
import 'package:new_workout_app/colors.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launchOn;

  Description(
      {required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launchOn}); // const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorForBackground,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  )),
                  Positioned(
                    bottom: 15,
                    child: Text(
                      '⭐ Average rating  $vote',
                      style: TextStyle(color: colorForText, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Text(
                name != null ? name : "Not loaded",
                style: TextStyle(fontSize: 24, color: colorForText),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Releasing on $launchOn',
                style: TextStyle(fontSize: 14, color: colorForText),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      '$description',
                      style: TextStyle(color: colorForText, fontSize: 15),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
