import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
//

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  List title = [
    'Safe & Secure',
    'Zero Transaction Charges',
    'All Upi Apps in One'
  ];

  List description = [
    'Your Payments Are 100% Safe & Secure.',
    'Zero Transaction Charges On Payment.',
    'Send Money To Any Upi Account From One App via Different Apps.'
    // 'Send Money To Any Upi Account From One App.'
    // 'Get Zero Charges On Transaction.',
  ];

  List images = [
    'assets/images/logo.png',
    'assets/images/logo.png',
    'assets/images/logo.png'
  ];

  int ind = 0;

  Widget textDisplay(int i) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(20.0),
      // ),
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            padding: EdgeInsets.all(20.0),
            child: Image.asset(images[i]),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Text(
              title[i],
              style: TextStyle(fontSize: 24.0),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              description[i],
              style: TextStyle(fontSize: 18.0, color: Colors.black38),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
      // child: Container(
      //   height: MediaQuery.of(context).size.height * 0.6,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(15.0),
      //     image: DecorationImage(
      //       image: AssetImage('assets/images/card.jpg'),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   child: Center(
      //     child: Text(
      //       a,
      //       style: TextStyle(color: Colors.white, fontSize: 24.0),
      //     ),
      //   ),
      // ),
    );
  }

  Widget bottomCircle(int i) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, bottom: 20.0),
      height: 20.0,
      width: 20.0,
      decoration: BoxDecoration(
        color: ind == i
            ? Theme.of(context).accentColor
            : Colors.black12,
        shape: BoxShape.circle,
        
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              itemCount: title.length,
              itemBuilder: (BuildContext context, int index) {
                return textDisplay(index);
              },
              onPageChanged: (index) {
                // if (index == 2) {
                //   showFloatingActionButton = true;
                //   // } else {
                //   //   showFloatingActionButton = false;
                // }
                ind = index;
                setState(() {});
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (var i = 0; i < title.length; i++) bottomCircle(i)
            ],
          )
          // Row(
          //   children: <Widget>[

          //   ],
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/login'),
        child: Icon(
          Icons.forward,
          color: Theme.of(context).primaryColorLight,
          // size: 30.0,
        ),
        // splashColor: Theme.of(context).primaryColorLight,
        // mini: true,
        tooltip: 'Login',
      ),
      // showFloatingActionButton
      //     ?
      // : SizedBox(),
    );
  }
}
