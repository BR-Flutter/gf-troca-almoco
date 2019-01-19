import 'package:flutter/material.dart';
import 'package:gf_troca_almoco/pages/home/home.provider.dart';
import 'package:gf_troca_almoco/pages/home/home.model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc bloc;

  @override
  void initState() {}

  @override
  void didChangeDependencies() {
//    bloc = HomeBlocProvider.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
//    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloc = HomeBlocProvider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          elevation: 0.0,
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[],
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _headerWeek(context, bloc),
            Flexible(
                fit: FlexFit.loose,
                child: Container(
                  color: Colors.green[400],
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: PageView(
                      controller: bloc.pageController,
                      onPageChanged: (index) {
                        print('index $index');
//                        pageChanged(index);
                      },
                      children: <Widget>[
                        ListView(
                          children: <Widget>[_dish(context)],
                        ),
                        ListView(
                          children: <Widget>[_dish(context), _dish(context)],
                        ),
                        ListView(
                          children: <Widget>[
                            _dish(context),
                            _dish(context),
                            _dish(context)
                          ],
                        ),
                        ListView(
                          children: <Widget>[
                            _dish(context),
                            _dish(context),
                            _dish(context),
                            _dish(context)
                          ],
                        ),
                        ListView(
                          children: <Widget>[
                            _dish(context),
                            _dish(context),
                            _dish(context),
                            _dish(context),
                            _dish(context)
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }

  Widget _headerWeek(BuildContext context, HomeBloc bloc) {
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
              children: listDayWeek(context, bloc),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dish(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Prato Principal',
                      style: Theme.of(context).textTheme.display1),
                  Text('Bife de palma ao vinagre',
                      style: Theme.of(context).textTheme.display2),
                ],
              ),
              IconButton(
                icon: Icon(Icons.autorenew),
              )
            ],
          )),
    );
  }

  List<Widget> listDayWeek(BuildContext context, HomeBloc bloc) {
    List<Widget> list = [];
    var now = new DateTime.now();
    print(now.month);
    for (var i = 0; i < bloc.response.length; i++) {
      Widget day = _dayWeek(context, Day.fromJSON(bloc.response[i]), i);
      list.add(day);
    }
    return list;
  }

  Widget _dayWeek(BuildContext context, Day day, int page) {
    return GestureDetector(
      onTap: () {
        bloc.pageController.animateToPage(page,
            duration: Duration(milliseconds: 480), curve: Curves.elasticIn);
      },
      child: Column(
        children: <Widget>[
          Text(day.mes, style: Theme.of(context).textTheme.body1),
          Text(day.numeroDia.toString(),
              style: Theme.of(context).textTheme.title),
          Text(day.nomeDia, style: Theme.of(context).textTheme.body2),
        ],
      ),
    );
  }
}
