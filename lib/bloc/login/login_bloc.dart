import 'package:ngts/model/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => LoginInitial();

  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    print('''
****************************************************************    
                Transition is $transition
****************************************************************''');
    super.onTransition(transition);
  }

  void googleLoginButton() {
    dispatch(LoginButtonPressed());
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      FirebaseUser user = await UserRepository().signInUsingGoogle();
      if (user != null) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setStringList('Account',
            [user.photoUrl, user.displayName, user.email, user.phoneNumber]);
        yield LoginSuccessful();
      } else {
        yield LoginFailure(error: 'User Cancel Login');
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
