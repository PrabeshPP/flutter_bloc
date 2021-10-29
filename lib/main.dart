import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/logic/cubit/blocobserver.dart';
import 'package:flutter_bloc1/logic/cubit/countercubit.dart';
import 'package:flutter_bloc1/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc1/presentation/router/app_router.dart';

class Myclass extends Equatable {
  final int value;

  Myclass({required this.value});
  @override
  // TODO: implement props
  List<Object?> get props => [value];
}

void main() {
  final a = Myclass(value: 1);
  final b = Myclass(value: 1);
  print(a == b);
 ;
  // Bloc.observer = SimpleBlocObserver();
  // runApp(MyApp(
  //   approuter: AppRouter(),
  //   connectivity: Connectivity(),
  // ));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  final AppRouter approuter;
  const MyApp({Key? key, required this.connectivity, required this.approuter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<Countercubit>(
          create: (context) => Countercubit(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: approuter.onGenerateRoute,
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
