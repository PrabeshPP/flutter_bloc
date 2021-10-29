import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/logic/cubit/internet_cubit.dart';

class Countercubit extends Cubit<int> {
  

  Countercubit() : super(0);
  void increment() => emit(state + 2);
  void decrement() => emit(state - 2);

  void dispose() {}
}
