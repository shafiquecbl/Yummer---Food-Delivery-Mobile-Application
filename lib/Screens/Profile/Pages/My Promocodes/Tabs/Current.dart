import 'package:flutter/material.dart';

class Current extends StatefulWidget {
  @override
  _CurrentState createState() => _CurrentState();
}

class _CurrentState extends State<Current> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return Text('Current');
      },
    );
  }
}
