import 'package:flutter/material.dart';
import 'package:gf_troca_almoco/pages/home/home.model.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  TabController tabController;
  int _currentPage;
  final _currentTabController = BehaviorSubject<int>();

  final _colorAnimationController = BehaviorSubject<Color>();

  Stream<Color> get color => _colorAnimationController.stream;

  setColor(Color value) {
    _colorAnimationController.sink.add(value);
  }

  constructor() {
    listen();
  }

  Stream<int> get currentTab => _currentTabController.stream;

  List<Map> response = [
    {
      'numeroDia': 21,
      'mes': 'JAN',
      'nomeDia': 'Segunda',
      'dish': [
        {'type': 1, 'name': 'Strogonoff carne', 'swap': true},
        {'type': 2, 'name': 'Batata Chips', 'swap': true},
        {'type': 3, 'name': 'Moranguete', 'swap': false},
        {'type': 4, 'name': 'Alface', 'swap': false},
        {'type': 5, 'name': 'Jiló', 'swap': false}
      ]
    },
    {
      'numeroDia': 22,
      'mes': 'JAN',
      'nomeDia': 'Terça',
      'dish': [
        {'type': 1, 'name': 'Strogonoff carne', 'swap': true},
        {'type': 2, 'name': 'Batata Chips', 'swap': false},
        {'type': 3, 'name': 'Fruta', 'swap': false},
        {'type': 4, 'name': 'Alface', 'swap': false},
        {'type': 5, 'name': 'Jiló', 'swap': false}
      ]
    },
    {
      'numeroDia': 23,
      'mes': 'JAN',
      'nomeDia': 'Quarta',
      'dish': [
        {'type': 1, 'name': 'Strogonoff carne', 'swap': true},
        {'type': 2, 'name': 'Batata Chips', 'swap': false},
        {'type': 3, 'name': 'Moranguete', 'swap': false},
        {'type': 4, 'name': 'Alface', 'swap': false},
        {'type': 5, 'name': 'Jiló', 'swap': false}
      ]
    },
    {
      'numeroDia': 24,
      'mes': 'JAN',
      'nomeDia': 'Quinta',
      'dish': [
        {'type': 1, 'name': 'Strogonoff carne', 'swap': true},
        {'type': 2, 'name': 'Batata Chips', 'swap': false},
        {'type': 3, 'name': 'Moranguete', 'swap': false},
        {'type': 4, 'name': 'Alface', 'swap': false},
        {'type': 5, 'name': 'Jiló', 'swap': false}
      ]
    },
    {
      'numeroDia': 25,
      'mes': 'JAN',
      'nomeDia': 'Sexta',
      'dish': [
        {'type': 1, 'name': 'Strogonoff carne', 'swap': true},
        {'type': 2, 'name': 'Batata Chips', 'swap': false},
        {'type': 3, 'name': 'Moranguete', 'swap': false},
        {'type': 4, 'name': 'Alface', 'swap': false},
        {'type': 5, 'name': 'Jiló', 'swap': false}
      ]
    },
  ];

  dispose() {}

  void listen() {
    currentTab.listen((data) => {print(data)});
  }

  void toPage(int page) {
    tabController.animateTo(page,
        duration: Duration(milliseconds: 280), curve: Curves.ease);
    setPage(page);
  }

  void setPage(page) {
    _currentPage = page;
    _currentTabController.add(_currentPage);
  }
}
