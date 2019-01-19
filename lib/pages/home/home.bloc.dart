import 'package:flutter/material.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final pageController = PageController(initialPage: 1);
  List<Map> response = [
    {'numeroDia': 21, 'mes': 'JAN', 'nomeDia': 'Segunda'},
    {'numeroDia': 22, 'mes': 'JAN', 'nomeDia': 'Terça'},
    {'numeroDia': 23, 'mes': 'JAN', 'nomeDia': 'Quarta'},
    {'numeroDia': 24, 'mes': 'JAN', 'nomeDia': 'Quinta'},
    {'numeroDia': 25, 'mes': 'JAN', 'nomeDia': 'Sexta'},
  ];
}
