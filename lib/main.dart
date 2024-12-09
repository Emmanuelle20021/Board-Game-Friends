import 'package:board_game_friends/shared/utils/constants.dart';
import 'package:board_game_friends/shared/utils/routes/app_routes.dart';
import 'package:board_game_friends/shared/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'keys/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.kAppName,
      theme: Constants.kThemeData,
      initialRoute: RoutesNames.login,
      routes: appRoutes,
    );
  }
}
