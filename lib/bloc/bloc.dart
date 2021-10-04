import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent{}
class Increment extends CounterEvent{}

class CounterBLoc extends Bloc<CounterEvent,int>{
  CounterBLoc():super(0){
    on <Increment>((event,emit)=>emit(state+1));
  }
  

}