import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super();

  @override
  List<Object> get props => props;
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationEvent {
  final String token;

  LoggedIn({@required this.token}) : super([token]);

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}

// import 'package:equatable/equatable.dart';

// abstract class AutheticationEvent extends Equatable {
//   AutheticationEvent([List props = const []]);

//   @override
//   List<Object> get props => props;
// }

// class Start extends AutheticationEvent {}
