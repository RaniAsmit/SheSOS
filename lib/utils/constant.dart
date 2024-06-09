import 'package:flutter/material.dart';

void goTo(BuildContext context, Widget nextScreen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => nextScreen),
  );
}

dialogue(BuildContext context, String text) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(text),
          ));
}

progressIndicator(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: Colors.grey,
            strokeWidth: 4,
          )));
}
