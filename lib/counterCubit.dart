import 'package:flutter_bloc/flutter_bloc.dart';

class Counterubit extends Cubit<int> {
  Counterubit() : super(0);
  void increment() => emit(state + 5);
  void decrement() => emit(state - 5);
  
}
