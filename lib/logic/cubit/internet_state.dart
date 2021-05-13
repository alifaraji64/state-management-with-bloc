part of 'internet_cubit.dart';

enum ConnectionType { Wifi, Mobile }

class InternetState {}

//we are splitting our state to mupltiple classes because when we are instanciating the class we are going to start with InternetLoading then after listening to stream that is com
class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;
  InternetConnected({@required this.connectionType});
}

class InternetDisconnected extends InternetState {}
