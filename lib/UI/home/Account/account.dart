import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  final List user;
  Account(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(user[0]),
                radius: 100.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                user[1],
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                user[2],
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '${user[3]}',
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
