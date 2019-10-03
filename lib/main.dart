import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//
import 'package:ngts/bloc/authentication/bloc.dart';
//
import 'share_p.dart';
import 'package:ngts/UI/home/home_page.dart';
import 'package:ngts/UI/login/login.dart';
import 'package:ngts/splash_screen.dart';
import 'package:ngts/start_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  SharedP.sharedPreferences = await SharedPreferences.getInstance();
  // bool google = await UserRepository().isSignIn();
  // print('Is Sign In Or Not $google');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) {
      runApp(
        BlocProvider(
          builder: (context) {
            return AuthenticationBloc()..dispatch(AppStarted());
          },
          child: MyApp(),
        ),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NGTS',
      theme: ThemeData(
        accentColor: Colors.orange,
        // accentColor: Colors.orange,
        primaryColorLight: Colors.white,
        primaryColorDark: Colors.red,
        fontFamily: 'Sans',
        cardTheme: CardTheme(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          splashColor: Colors.white,
        ),
        buttonTheme: ButtonThemeData(
          splashColor: Colors.white,
          buttonColor: Color.fromRGBO(250, 122, 11, 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
        ),
      ),
      routes: {
        // '/': (context) => SplashScreen(),
        '/start': (context) => StartPage(),
        '/login': (context) => Login(),
        '/home': (context) => HomePage()
      },
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
         
          if (state is AuthenticationUninitialized ||
              state is AuthenticationLoading) {
            print('Internet');
            return SplashScreen();
          }
          if (state is AuthenticationAuthenticated) {
            return HomePage();
          }
          if (state is AuthenticationUnauthenticated) {
            return StartPage();
          }
          return SizedBox();
        
        },
      ),

      // home: BlocListener(
      //   bloc: BlocProvider.of<AuthenticationBloc>(context),
      //   condition: (previousState, currentState) {
      //     print('Condition is ${previousState != currentState}');
      //     return previousState != currentState;
      //   },
      //   listener: (BuildContext context, AuthenticationState state) {
      //     if (state is InitialCheckingAuthentication) {
      //       print('Splash Screen');
      //       return SplashScreen();
      //     } else if (state is SuccessfulAuthentication) {
      //       print('Successful Authentication');
      //       return HomePage();
      //     } else if (state is NotAuthentication) {
      //       print('Not Authentication');
      //       return StartPage();
      //     }
      //     return Text('None Of Above');
      //   },
      //   child: SplashScreen(),
      //   //   // child: BlocBuilder(
      //   //   //   bloc: BlocProvider.of<AuthenticationBloc>(context),
      //   //   //   builder: (BuildContext context, AuthenticationState state) {
      //   //   //     if (state is InitialCheckingAuthentication) {
      //   //   //       print('Splash Screen');
      //   //   //       return SplashScreen();
      //   //   //     } else if (state is SuccessfulAuthentication) {
      //   //   //       print('Successful Authentication');
      //   //   //       return HomePage();
      //   //   //     } else if (state is NotAuthentication) {
      //   //   //       print('Not Authentication');
      //   //   //       return StartPage();
      //   //   //     }
      //   //   //     return Text('None Of Above');
      //   //   //   },
      //   //   // ),
      // ),
      // home: BlocBuilder(
      //   bloc: BlocProvider.of<AuthenticationBloc>(context),
      //   condition: (previousState, currentState) {
      //     print('Condition is ${previousState != currentState}');
      //     return previousState != currentState;
      //   },
      //   builder: (BuildContext context, AuthenticationState state) {
      //     if (state is InitialCheckingAuthentication) {
      //       print('Splash Screen');
      //       return SplashScreen();
      //     } else if (state is SuccessfulAuthentication) {
      //       print('Successful Authentication');
      //       return HomePage();
      //     } else if (state is NotAuthentication) {
      //       print('Not Authentication');
      //       return StartPage();
      //     }
      //     return Text('None Of Above');
      //   },
      // ),
      // home: SplashScreen(),
      // home: Login(),
      // home: StartPage(),
      // home: HomePage(),
    );
  }
}
