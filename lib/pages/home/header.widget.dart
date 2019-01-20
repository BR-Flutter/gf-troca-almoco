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
    Widget day = DayWeek(Day.fromJSON(bloc.response[i]), i, bloc);
    list.add(day);
  }
  return list;
}

class DayWeek extends StatefulWidget {
  Day day;
  int page;
  HomeBloc bloc;

  DayWeek(this.day, this.page, this.bloc);

  @override
  _DayWeekState createState() => _DayWeekState();
}

class _DayWeekState extends State<DayWeek> with TickerProviderStateMixin {
  AnimationController animation;
  Animation<Color> increaseAnimationColor;

  @override
  void initState() {
    animation = new AnimationController(
        duration: Duration(milliseconds: 280), vsync: this);
    increaseAnimationColor =
        new ColorTween(begin: Colors.white54, end: Colors.white)
            .animate(animation)
              ..addListener(() {
                this.widget.bloc.setColor(increaseAnimationColor.value);
              });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () {
              this.widget.bloc.toPage(this.widget.page);
            },
            highlightColor: Colors.green[700],
            splashColor: Colors.green[600],
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
              child: StreamBuilder(
                  builder: (BuildContext context, AsyncSnapshot snapshotPage) {
                    print('re-build');
                    return StreamBuilder(
                      builder: (BuildContext context,
                          AsyncSnapshot snapshotAnimaton) {
                        return Column(
                          children: <Widget>[
                            Text(this.widget.day.mes,
                                style: Theme.of(context).textTheme.body1),
                            Text(this.widget.day.numeroDia.toString(),
                                style: Theme.of(context).textTheme.title),
                            Text(this.widget.day.nomeDia,
                                style: Theme.of(context).textTheme.body2),
                          ],
                        );
                      },
                    );
                  },
                  stream: this.widget.bloc.currentPage,
                  initialData: 0),
            )),
      ),
    );
  }
}
