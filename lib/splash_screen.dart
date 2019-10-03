// import 'dart:async';
//
import 'package:flutter/material.dart';
//
// import 'package:all_pay/services/share_p.dart';
//
// import 'package:flare_flutter/flare_actor.dart';

class SplashScreen extends StatelessWidget {
  // pageTransition(BuildContext context) {
  //   Timer(Duration(seconds: 2), () {
  //     List account = ShareP.sharedPreferences.getStringList('Account');
  //     if (account != null) {
  //       Navigator.of(context).pushNamed('/home');
  //     } else {
  //       Navigator.of(context).pushNamed('/start');
  //     }
  //   });
  // }
  // final bool internet;
  // SplashScreen(this.internet);

  @override
  Widget build(BuildContext context) {
    // pageTransition(context);
    // return Container(
    //   color: Colors.white,
    //   child: FlareActor(
    //     'assets/flare/logo.flr',
    //     animation: 'Bigger',
    //     // isPaused: true,
    //   ),
    //   // child: CircularProgressIndicator(),
    // );
    return Scaffold(
      // backgroundColor: Theme.of(context).accentColor,
      body: Center(
        // child: internet ? showLogo() : showNoInternetLogo(),
        child: showLogo(),
      ),
    );
  }

  Widget showLogo() {
    return Container(
      height: 120.0,
      width: 120.0,
      child: Image.asset(
        'assets/images/logo.png',
      ),
    );
  }

  // Widget showNoInternetLogo() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       showLogo(),
  //       SizedBox(
  //         height: 20.0,
  //       ),
  //       Text(
  //         'No Internet Connection',
  //         style: TextStyle(
  //           color: Colors.red,
  //           fontSize: 24.0
  //         ),
  //       )
  //     ],
  //   );
  // }
}
