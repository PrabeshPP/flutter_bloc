import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc1/presentation/homepage.dart';
import 'package:flutter_bloc1/presentation/screens/second_screen.dart';
import 'package:flutter_bloc1/presentation/screens/thirdscreen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => Homepage());

      case "/second":
        return MaterialPageRoute(builder: (_) => SecondPage());

      case "/third":
        return MaterialPageRoute(builder: (_) => ThirdPage());

      default:
        return null;
    }
  }
}
