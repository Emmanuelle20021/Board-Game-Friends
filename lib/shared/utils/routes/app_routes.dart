import 'package:board_game_friends/modules/auth/login/screens/login_screen.dart';
import 'package:board_game_friends/modules/auth/signup/screen/registration_screen.dart';
import 'package:board_game_friends/modules/user/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'routes_names.dart';

Map<String, Widget Function(BuildContext context)> get appRoutes => {
      RoutesNames.home: (context) => HomeScreen(),
      RoutesNames.login: (context) => LoginScreen(),
      RoutesNames.register: (context) => RegistrationScreen(),
    };
