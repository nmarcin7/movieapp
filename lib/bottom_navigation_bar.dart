// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:new_workout_app/colors.dart';
//
// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: colorForBackground,
//       unselectedItemColor: colorForText,
//       onTap: (int index) {
//         switch (index) {
//           case 0:
//             Navigator.pushNamed(context, '/');
//             break;
//           case 1:
//             Navigator.pushNamed(context, 'favourites');
//             break;
//         }
//       },
//       items: [
//         const BottomNavigationBarItem(
//             icon: Icon(
//               FontAwesomeIcons.home,
//               size: 20,
//             ),
//             label: 'Home'),
//         BottomNavigationBarItem(
//           icon: Icon(
//             FontAwesomeIcons.solidHeart,
//             size: 20,
//             color: colorForText,
//           ),
//           label: 'Favourtie movies',
//         ),
//       ],
//     );
//   }
// }
