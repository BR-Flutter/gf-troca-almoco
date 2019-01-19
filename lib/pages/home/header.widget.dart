import 'package:flutter/material.dart';
import 'package:gf_troca_almoco/pages/home/home.provider.dart';
import 'package:gf_troca_almoco/pages/home/home.model.dart';

TextStyle selected = TextStyle(fontSize: 36.0, color: Colors.white);

Widget headerWeek(BuildContext context, HomeBloc bloc) {
  return Container(
    color: Colors.green[800],
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Text(
                'Semana 04',
                style: Theme.of(context).textTheme.body1,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _listDayWeek(context, bloc),
          ),
        ),
      ],
    ),
  );
}

List<Widget> _listDayWeek(BuildContext context, HomeBloc bloc) {
  List<Widget> list = [];
  for (var i = 0; i < bloc.response.length; i++) {
    Widget day = _dayWeek(context, Day.fromJSON(bloc.response[i]), i, bloc);
    list.add(day);
  }
  return list;
}

Widget _dayWeek(BuildContext context, Day day, int page, HomeBloc bloc) {
  return GestureDetector(
    onTap: () {
      bloc.toPage(page);
    },
    child: StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print('re-build');
          return Column(
            children: <Widget>[
              Text(day.mes, style: Theme.of(context).textTheme.body1),
              Text(day.numeroDia.toString(),
                  style: Theme.of(context).textTheme.title),
              Text(day.nomeDia, style: Theme.of(context).textTheme.body2),
            ],
          );
        },
        stream: bloc.currentPage,
        initialData: 0),
  );
}
