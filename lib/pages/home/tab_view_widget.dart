import 'package:flutter/material.dart';
import 'package:gf_troca_almoco/pages/home/dish_widget.dart';
import 'package:gf_troca_almoco/pages/home/home.model.dart';

Widget TabView(int day, bloc) {
  return ListView.builder(
    padding: EdgeInsets.all(8.0),
    itemCount: Day.fromJSON(bloc.response[day]).dish.length,
    itemBuilder: (BuildContext context, int index) {
      return dish(context, Day.fromJSON(bloc.response[day]).dish[index]);
    },
  );
}