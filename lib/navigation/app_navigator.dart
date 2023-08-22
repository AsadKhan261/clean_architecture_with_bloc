import 'package:flutter/material.dart';

class AppNavigator {
  push(BuildContext context, Widget targetClass) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => targetClass));
  }
}
