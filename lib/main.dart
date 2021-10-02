import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/cubit.dart';

import 'counterpage.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(MyApp());
}

class MyApp extends MaterialApp {
  const MyApp({Key? key}) : super(key: key, home: const CounterPage());
}
