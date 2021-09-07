import 'package:flutter/material.dart';

navigatorPush(BuildContext context, bool rootNavigator, Widget page) {
  return Navigator.of(context, rootNavigator: rootNavigator)
      .push(MaterialPageRoute(builder: (builder) => page));
}
