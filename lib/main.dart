import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/logic/cubit/blocobserver.dart';
import 'package:flutter_bloc1/logic/cubit/countercubit.dart';

import 'package:flutter_bloc1/presentation/router/app_router.dart';


void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final AppRouter _approuter=AppRouter();
    return BlocProvider(
      create: (context)=>Countercubit(),
      child: MaterialApp(
        onGenerateRoute: _approuter.onGenerateRoute,
        // initialRoute: "/",
        // routes: {
        //   "/": (_) => BlocProvider.value(
        //     value:_countercubit
        //   ,child: Homepage()),
        //   "/second": (_) => BlocProvider.value(
        //     value:_countercubit ,
        //   child: SecondPage()),
        //   "/third": (_) => BlocProvider.value(
        //     value:_countercubit,
        //   child: ThirdPage())
        // }
      ),
    );
  }
}
