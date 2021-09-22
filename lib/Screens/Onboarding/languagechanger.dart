import 'package:flutter/material.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  String? _selectedlanguage;
  List<String> _language = [
    'English',
    'Española',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: DropdownButton<String>(
              items: _language.map((String val) {
                return new DropdownMenuItem<String>(
                  value: val,
                  child: new Text(val),
                );
              }).toList(),
              hint: Text("Please choose a location"),
              onChanged: (newVal) {
                _selectedlanguage = newVal;
                this.setState(() {});
              })),
    );
  }
}
