import 'package:flutter/material.dart';

class MyError extends StatefulWidget {
  final String? error;
  const MyError({@required this.error});

  @override
  _MyErrorState createState() => _MyErrorState();
}

class _MyErrorState extends State<MyError> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.error, color: Colors.red),
        SizedBox(
          width: 10,
        ),
        Text(
          '${widget.error}',
          style: TextStyle(color: Colors.red),
        )
      ],
    );
  }
}
