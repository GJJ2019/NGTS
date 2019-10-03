import 'package:flutter/material.dart'
    show
        BuildContext,
        GlobalKey,
        ScaffoldState,
        SnackBar,
        Text,
        TextAlign,
        TextStyle,
        Theme;

class ShowSnackBar {
  showSnackBar(BuildContext context, String message,
      GlobalKey<ScaffoldState> scaffoldState) {
    scaffoldState.currentState.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text(
          message,
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
            fontSize: 18.0,
            fontFamily: 'Sans',
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
    );
  }
}
