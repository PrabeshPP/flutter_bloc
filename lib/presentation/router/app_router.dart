import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/logic/cubit/countercubit.dart';
import 'package:flutter_bloc1/presentation/homepage.dart';
import 'package:flutter_bloc1/presentation/screens/second_screen.dart';
import 'package:flutter_bloc1/presentation/screens/thirdscreen.dart';

class AppRouter {
  final Countercubit _counterCubit = Countercubit();
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => BlocProvider.value(
          value:_counterCubit
        ,child: Homepage()));

      case "/second":
        return MaterialPageRoute(builder: (_) => BlocProvider.value(
          value: _counterCubit
        ,child: SecondPage()));

      case "/third":
        return MaterialPageRoute(builder: (_) => BlocProvider.value(
          value:_counterCubit,
          child: ThirdPage()));

      default:
        return null;
    }
    
  }

}
