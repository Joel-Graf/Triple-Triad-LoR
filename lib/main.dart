import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Providers/auth_controller.dart';
import 'package:truco_of_legends/Pages/Game/Providers/board_controller.dart';
import 'package:truco_of_legends/Pages/Game/Providers/game_controller.dart';
import 'package:truco_of_legends/Pages/Game/Providers/hand_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:truco_of_legends/Pages/Game/game_page.dart';
import 'package:truco_of_legends/Pages/Auth/auth_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

@immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => playerController,
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => enemyController,
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => BoardController(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => GameController(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => AuthController(),
        ),
      ],
      child: const MaterialApp(
        title: 'truco_of_legends',
        home: true ? LoginPage() : GamePage(),
      ),
    );
  }
}
