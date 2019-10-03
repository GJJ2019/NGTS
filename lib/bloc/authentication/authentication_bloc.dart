import 'package:ngts/model/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  void onTransition(
      Transition<AuthenticationEvent, AuthenticationState> transition) {
    print('''
****************************************************************    
                Transition is $transition
****************************************************************''');
    super.onTransition(transition);
  }

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      yield AuthenticationLoading();
      // bool connection = await UserRepository().connectivity();
      // print('Connection is $connection');
      // if (connection) {
      bool login = await UserRepository().isSignIn();
      print('''
****************************************************************    
                  Login Or Not is $login  
****************************************************************''');
      if (login) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    } else if (event is LoggedOut) {
      // bool login = await UserRepository().isSignIn();
//         print('''
// ****************************************************************
//                   Login Or Not is $login
// ****************************************************************''');
      yield AuthenticationLoading();
      UserRepository().signOut();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.remove('Account');
      yield AuthenticationUnauthenticated();
    }
//     } else {
//       print('''
// ****************************************************************
//                   No Internet Connection
// ****************************************************************''');
//       yield AuthenticationNoInternet();
    // }
  }
}
