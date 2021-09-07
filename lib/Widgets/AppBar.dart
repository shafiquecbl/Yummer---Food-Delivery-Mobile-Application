import 'package:flutter/material.dart';
import '../constants.dart';

PreferredSizeWidget appBar(BuildContext context, {@required String? title}) {
  return AppBar(
      iconTheme: IconThemeData.fallback(),
      automaticallyImplyLeading: true,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        title.toString(),
        style: TextStyle(color: appBarText),
      ));
}
