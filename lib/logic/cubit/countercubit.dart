import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/logic/cubit/internet_cubit.dart';

class Countercubit extends Cubit<int> {
  

  Countercubit() : super(100);
  void increment() => emit(state + 50);
  void decrement() => emit(state - 50);

  void dispose() {}
}
