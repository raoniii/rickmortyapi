import 'package:flutter/material.dart';
import 'package:rickmortydex/screen/rickmortydex_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.light().copyWith(primary: Colors.black87)),
        home: RickMortView());
  }
}
