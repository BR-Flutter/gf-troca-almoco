import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            _headerWeek(context),
            Flexible(
                fit: FlexFit.loose,
                child: Container(
                  color: Colors.greenAccent,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: PageView(
                      children: <Widget>[
                        ListView(
                          children: <Widget>[
                            _dish(context),
                            _dish(context),
                            _dish(context),
                            _dish(context),
                          ],
                        ),
                        ListView(
                          children: <Widget>[
                            _dish(context),
                            _dish(context),
                            _dish(context),
                            _dish(context),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}

Widget _headerWeek(BuildContext context) {
  return Container(
    color: Colors.green,
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
            children: <Widget>[
              _dayWeek(context),
              _dayWeek(context),
              _dayWeek(context),
              _dayWeek(context),
              _dayWeek(context)
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _dayWeek(BuildContext context) {
  return Column(
    children: <Widget>[
      Text('JAN', style: Theme.of(context).textTheme.body1),
      Text('21', style: Theme.of(context).textTheme.title),
      Text('Segunda', style: Theme.of(context).textTheme.body2),
    ],
  );
}

Widget _dish(BuildContext context) {
  return Card(
    color: Colors.white,
    child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Prato 01', style: Theme.of(context).textTheme.display1),
                Text('Prato 01', style: Theme.of(context).textTheme.display2),
              ],
            ),
            IconButton(
              icon: Icon(Icons.add),
            )
          ],
        )),
  );
}
