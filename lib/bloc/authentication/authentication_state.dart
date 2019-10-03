import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const []]) : super();

  @override
  List<Object> get props => null;
}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUninitialized';
}

class AuthenticationAuthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationAuthenticated';
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnauthenticated';
}

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading';
}

class AuthenticationNoInternet extends AuthenticationState {
  @override
  String toString() => 'Authentication No Internet';
}

// import 'package:meta/meta.dart';
// import 'package:equatable/equatable.dart';

// abstract class AuthenticationState extends Equatable {
//   AuthenticationState([List props = const []]);

//   @override
//   List<Object> get props => props;
// }

// class InitialCheckingAuthentication extends AuthenticationState {
//   @override
//   String toString() => 'Checking Authetication';
// }

// class SuccessfulAuthentication extends AuthenticationState {
//   @override
//   String toString() => 'Successfully Autheticated';
// }

// class NotAuthentication extends AuthenticationState {
//   @override
//   String toString() => 'Not Autheticated';
// }

// class ErrorAuthentication extends AuthenticationState {
//   final String error;
//   ErrorAuthentication({@required this.error}) : super([error]);

//   @override
//   String toString() => 'Error Authentication';
// }
