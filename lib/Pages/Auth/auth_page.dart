// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:truco_of_legends/Pages/Auth/Widgets/auth_form.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color.fromARGB(126, 255, 0, 255),
//                     Color.fromARGB(228, 0, 243, 252),
//                   ],
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: double.infinity,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 10,
//                       horizontal: 70,
//                     ),
//                     margin: const EdgeInsets.all(10),
//                     transform: Matrix4.rotationZ(-4 * pi / 180)
//                       ..translate(-5.0),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.deepOrange.shade900,
//                       boxShadow: const [
//                         BoxShadow(
//                           blurRadius: 8,
//                           color: Colors.black26,
//                           offset: Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Text(
//                       'Truco of Legends',
//                       style: TextStyle(
//                         fontSize: 45,
//                         color: Theme.of(context).colorScheme.secondary,
//                       ),
//                     ),
//                   ),
//                   const AuthForm(),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
