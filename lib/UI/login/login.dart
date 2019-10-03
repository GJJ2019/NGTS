import 'package:ngts/UI/component/show_snack_bar.dart';
import 'package:flutter/material.dart';
//
import 'package:flutter_bloc/flutter_bloc.dart';
//
import 'package:ngts/bloc/login/bloc.dart';
//

class Login extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  // final _bloc = LoginBloc();

  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // Future<FirebaseUser> _signInUsingGoogle(BuildContext context) async {
  //   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  //   if (googleUser != null) {
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;

  //     final AuthCredential credential = GoogleAuthProvider.getCredential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     final FirebaseUser user =
  //         (await _auth.signInWithCredential(credential)).user;
  //     print("signed in " + user.displayName);
  //     return user;
  //   } else {
  //     print('Error while Login');
  //     ShowSnackBar().showSnackBar(context, 'Login Failed 😥', _scaffoldKey);
  //     return null;
  //   }
  //   // try {} catch (e) {
  //   //   print('Errors are $e');
  //   //   return null;
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => LoginBloc(),
      child: LoginUi(
        scaffoldState: _scaffoldState,
      ),
    );
  }

  // Widget loginInitial(BuildContext context) {
  //   return
  // }
// }

  // Widget loginInitialUi(BuildContext context) {
  //   return Card(
  //     margin: EdgeInsets.symmetric(horizontal: 50.0),
  //     child: BlocBuilder(
  //       bloc: _bloc,
  //       builder: (BuildContext context, LoginState state) {
  //         if (state is LoginInitial) {
  //           print('Login Initial');
  //           return loginButton(context);
  //         } else if (state is LoginSuccessful) {
  //           Navigator.of(context).pushReplacement(
  //             MaterialPageRoute(
  //               builder: (context) => Complete(),
  //             ),
  //           );
  //         } else if (state is LoginLoading) {
  //           return Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         } else if (state is LoginFailure) {
  //           // ShowSnackBar()
  //           //     .showSnackBar(context, 'Login Failed', _scaffoldState);
  //           return loginButton(context);
  //         }
  //         // return Center(child: Text('Hey There'));
  //         return SizedBox();
  //         // return loginButton(context);
  //         // return Center(
  //         //   child: CircularProgressIndicator(),
  //         // );
  //       },
  //     ),
  //   );
  // }

  // Widget loginButton(context) {
  //   return Center(
  //     child: OutlineButton(
  //       onPressed: () => _bloc.googleLoginButton(),
  //       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10.0),
  //       ),
  //       borderSide:
  //           BorderSide(width: 1.0, color: Theme.of(context).accentColor),
  //       highlightedBorderColor: Theme.of(context).accentColor,
  //       splashColor: Theme.of(context).accentColor,
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           Container(
  //             height: 30.0,
  //             width: 30.0,
  //             child: Image.asset('assets/images/google.png'),
  //           ),
  //           SizedBox(
  //             width: 15.0,
  //           ),
  //           Text(
  //             'Google',
  //             style: TextStyle(
  //                 fontSize: 24.0,
  //                 // letterSpacing: 1.1,
  //                 fontWeight: FontWeight.bold),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

class LoginUi extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldState;

  const LoginUi({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldState,
    // @required LoginBloc bloc,
  })  : _scaffoldState = scaffoldState,
        // _bloc = bloc,
        super(key: key);

  // final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  // final LoginBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body:
      key: _scaffoldState,
      backgroundColor: Theme.of(context).accentColor,
      body: Center(
        child: Container(
          height: 150.0,
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 30.0),
          child: BlocListener(
            bloc: BlocProvider.of<LoginBloc>(context),
            listener: (BuildContext context, LoginState state) {
              if (state is LoginSuccessful) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/home', (_) => false);
              } else if (state is LoginFailure) {
                ShowSnackBar().showSnackBar(
                    context, 'Login Failed 😓', _scaffoldState);
              }
            },
            child: BlocBuilder(
              bloc: BlocProvider.of<LoginBloc>(context),
              builder: (BuildContext context, LoginState state) {
                if (state is LoginInitial) {
                  print('Login Initial');
                  return loginButton(context);
                  // } else if (state is LoginSuccessful) {
                  //   // Navigator.of(context)
                  //   //     .pushNamedAndRemoveUntil('/home', (_) => false);
                  //   Navigator.of(context).pushNamed('/home');
                  //   return SizedBox();
                } else if (state is LoginLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LoginFailure) {
                  // ShowSnackBar()
                  //     .showSnackBar(context, 'Login Failed', _scaffoldState);
                  return loginButton(context);
                }
                // return Center(child: Text('Hey There'));
                return SizedBox();
                // return loginButton(context);
                // return Center(
                //   child: CircularProgressIndicator(),
                // );
              },
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Text(
        'Login',
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget loginButton(context) {
    return Center(
      child: OutlineButton(
        onPressed: () =>
            BlocProvider.of<LoginBloc>(context).googleLoginButton(),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        // borderSide:
        //     BorderSide(width: 1.0, color: Theme.of(context).accentColor),
        // highlightedBorderColor: Theme.of(context).accentColor,
        splashColor: Theme.of(context).accentColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 30.0,
              width: 30.0,
              child: Image.asset('assets/images/google.png'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Google',
              style: TextStyle(
                  fontSize: 24.0,
                  // letterSpacing: 1.1,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

// ! After Login --------------------------------------

// class Complete extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // Container(
//             //   height: 150.0,
//             //   // color: Colors.black,
//             //   child: Image.asset('assets/images/done.png'),
//             // ),
//             Container(
//               height: 300.0,
//               // color: Colors.black,
//               child: FlareActor(
//                 'assets/flare/done.flr',
//                 animation: 'done',
//                 isPaused: false,
//                 fit: BoxFit.contain,
//               ),
//             ),
//             SizedBox(
//               height: 30.0,
//             ),
//             Text(
//               'Successfully Sign In',
//               style: TextStyle(
//                 fontSize: 24.0,
//               ),
//             ),
//           ],
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {},
//       //   child: Icon(
//       //     CupertinoIcons.forward,
//       //     color: Theme.of(context).primaryColorLight,
//       //     // size: 30.0,
//       //   ),
//       //   splashColor: Theme.of(context).primaryColorLight,
//       //   // mini: true,
//       //   tooltip: 'Complete',
//       // ),
//       // !
//       floatingActionButton: RaisedButton(
//         child: Text(
//           'Let\'s Go',
//           style: TextStyle(
//               color: Theme.of(context).primaryColorLight, fontSize: 20.0),
//         ),
//         onPressed: () {
//           print('''
//           Account Details - :${ShareP.sharedPreferences.getStringList('Account')}
//           ''');
//           Navigator.of(context).pushNamedAndRemoveUntil('/home', (_) => false);
//           // Navigator.of(context).pushAndRemoveUntil(
//           //     MaterialPageRoute(builder: (context) => HomePage()),
//           //     (_) => false);
//           // Navigator.of(context).pushReplacement(
//           //   MaterialPageRoute(
//           //     builder: (context) => HomePage(),
//           //   ),
//           // );
//         },
//       ),
//       // ?
//       // floatingActionButton: OutlineButton(
//       //   onPressed: () {},
//       //   padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
//       //   shape: RoundedRectangleBorder(
//       //     borderRadius: BorderRadius.circular(10.0),
//       //   ),
//       //   borderSide:
//       //       BorderSide(width: 1.0, color: Theme.of(context).accentColor),
//       //   highlightedBorderColor: Theme.of(context).accentColor,
//       //   splashColor: Theme.of(context).accentColor,
//       //   child: Text(
//       //     'Let\'s Go',
//       //     style: TextStyle(
//       //       fontSize: 20.0,
//       //       color: Theme.of(context).accentColor
//       //       // fontWeight: FontWeight.bold
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }
