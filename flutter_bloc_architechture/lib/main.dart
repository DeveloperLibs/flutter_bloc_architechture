import 'package:flutter/material.dart';
import 'package:flutter_bloc_architechture/src/ui/country_list.dart';

void main() {
  runApp(App());
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
        primaryColor:  Color(0xFF02BB9F),
        primaryColorDark:  Color(0xFF167F67),
        accentColor:  Color(0xFF167F67),
      ),
      home: Scaffold(
        body: CountryList(),
      ),
    );
  }
}
