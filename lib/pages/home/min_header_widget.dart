import 'package:flutter/material.dart';
import 'package:gf_troca_almoco/pages/home/home.provider.dart';
import 'package:gf_troca_almoco/pages/home/home.model.dart';

Widget minHeader(BuildContext context, HomeBloc bloc) {
  return Container(
    constraints: BoxConstraints.expand(),
    color: Colors.green[800],
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _list(context, bloc)
    ),
  );
}

List<Widget> _list(BuildContext context, HomeBloc bloc) {
  List<Widget> list = [];
  for (var i = 0; i < bloc.response.length; i++) {
    print(bloc.response[i]);
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
        duration: Duration(milliseconds: 180), vsync: this);
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
                    if (this.widget.page == snapshotPage.data) {
                      animation.forward();
                      return StreamBuilder(
                        builder: (BuildContext context,
                            AsyncSnapshot snapshotAnimaton) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                this.widget.day.mes,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: snapshotAnimaton.data,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(this.widget.day.numeroDia.toString(), style: TextStyle(fontSize: 28.0, color: snapshotAnimaton.data))
                            ],
                          );
                        },
                        stream: this.widget.bloc.color,
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            this.widget.day.mes,
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w500),
                          ),
                          Text(this.widget.day.numeroDia.toString(), style: TextStyle(fontSize: 28.0))
                        ],
                      );
                    }
                  },
                  stream: this.widget.bloc.currentTab,
                  initialData: 0),
            )),
      ),
    );
  }
}
