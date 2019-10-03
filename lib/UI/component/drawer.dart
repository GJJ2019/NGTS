import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ngts/UI/home/Account/account.dart';

class DrawerHome {
  Widget drawer(BuildContext context, List<String> user,
      GlobalKey<ScaffoldState> scaffoldState) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(              
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(user[0]),
                  ),
                  Text(
                    user[1],
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Theme.of(context).primaryColorLight),
                  ),
                  Text(
                    user[2],
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Theme.of(context).primaryColorLight),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
              ),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    CupertinoIcons.home,
                    color: Theme.of(context).accentColor,
                  ),
                  title: Text(
                    'Home',
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.shopping_cart,
                    color: Theme.of(context).accentColor,
                  ),
                  title: Text(
                    'My Order',
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.profile_circled,
                    color: Theme.of(context).accentColor,
                  ),
                  title: Text(
                    'My Account',
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Account(user)));
                  },
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.phone,
                    color: Theme.of(context).accentColor,
                  ),
                  title: Text(
                    'Contact Us',
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.info,
                    color: Theme.of(context).accentColor,
                  ),
                  title: Text(
                    'About Us',
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.share_up,
                    color: Theme.of(context).accentColor,
                  ),
                  title: Text(
                    'Share Us  😃',
                  ),
                  onTap: () async {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
