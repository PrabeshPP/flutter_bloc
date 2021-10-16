import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;

  StreamSubscription? connectivityStreamSubscription;
  InternetCubit({required this.connectivity}) : super(InternetInitial()){
    connectivityStreamSubscription=connectivity.onConnectivityChanged.listen((event) {
      if(event==ConnectivityResult.wifi){
        emitInternetconnected(ConnectionType.Wifi);

      }else if(event==ConnectivityResult.mobile){
        emitInternetconnected(ConnectionType.Mobile);
      }else if(event==ConnectivityResult.none){
        emitInternetDisconnected();
      }
    });
  }
  void emitInternetconnected(ConnectionType _connectionType) =>
      emit(InternetConnected(connectionType: _connectionType));
  void emitInternetDisconnected() => emit(InternetDisconnected());
@override
Future<void>close(){
  connectivityStreamSubscription!.cancel();
  return super.close();
}
}
