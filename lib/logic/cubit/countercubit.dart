import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/logic/cubit/internet_cubit.dart';

class Countercubit extends Cubit<int> {
  final InternetCubit internetCubit;
  StreamSubscription? _streamSubscription;
  Countercubit({required this.internetCubit}) : super(100) {
    _streamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi) {
        increment();
      } else if (internetState is InternetDisconnected 
          ) {
        decrement();
      }
    });
  }
  void increment() => emit(state + 50);
  void decrement() => emit(state - 50);

  void dispose(){
    
  }
  
}
