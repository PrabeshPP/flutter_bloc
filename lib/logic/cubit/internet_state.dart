part of "internet_cubit.dart";

enum ConnectionType {
  Wifi,
  Mobile,
}

abstract class InternetState {}

class InternetInitial extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;

  InternetConnected({required this.connectionType});
}
class InternetDisconnected extends InternetState{
  
}
