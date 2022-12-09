import 'package:flutter/material.dart';
import 'package:googlemaps/constans/strings.dart';
import 'package:googlemaps/presentaion/screens/login_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LogInScreen(),
        );
    }
    return null;
  }
}
