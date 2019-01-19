import 'package:flutter/material.dart';
import 'package:gf_troca_almoco/pages/home/home.page.dart';
import 'package:gf_troca_almoco/pages/home/home.provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Trocas',
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'Roboto',
          textTheme: TextTheme(
            headline: TextStyle(
                fontSize: 72.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            title: TextStyle(fontSize: 36.0, color: Colors.white),
            display1: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.black54),
            display2: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.black26),
            body1: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.w500),
            body2: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
        home: HomeBlocProvider(
          child: HomePage(),
        ));
  }
}
