import 'package:flutter/material.dart';
import 'package:gf_troca_almoco/pages/home/home.provider.dart';
import 'package:gf_troca_almoco/pages/home/home.model.dart';
import 'package:gf_troca_almoco/pages/home/header.widget.dart';

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
    bloc = HomeBlocProvider.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.dispose();
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
            headerWeek(context, bloc),
            Flexible(
                fit: FlexFit.loose,
                child: Container(
                  color: Colors.green[400],
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: PageView(
                      controller: bloc.pageController,
                      onPageChanged: (page) {
                        bloc.setPage(page);
                      },
                      children: <Widget>[
                        ListView(
                          children: _listDish(
                              context, Day.fromJSON(bloc.response[0])),
                        ),
                        ListView(
                          children: _listDish(
                              context, Day.fromJSON(bloc.response[1])),
                        ),
                        ListView(
                          children: _listDish(
                              context, Day.fromJSON(bloc.response[2])),
                        ),
                        ListView(
                          children: _listDish(
                              context, Day.fromJSON(bloc.response[3])),
                        ),
                        ListView(
                          children: _listDish(
                              context, Day.fromJSON(bloc.response[4])),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }

  Widget _dish(BuildContext context, Dish dish) {
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
                  Text(_dishType(dish.type),
                      style: Theme.of(context).textTheme.display1),
                  Text(dish.name, style: Theme.of(context).textTheme.display2),
                ],
              ),
              _dishSwap(dish.swap)
            ],
          )),
    );
  }

  Widget _dishSwap(bool swap) {
    if (swap == true) {
      return IconButton(
        icon: Icon(Icons.autorenew),
      );
    }
    return new Container(padding: EdgeInsets.all(24.0));
  }

  String _dishType(int type) {
    switch (type) {
      case 1:
        return 'Prato Principal';
      case 2:
        return 'Prato Secundario';
      case 3:
        return 'Sobremesa';
      case 4:
        return 'Salada 1';
      case 5:
        return 'Salada 2';
    }
  }

  List<Widget> _listDish(BuildContext context, Day day) {
    List<Widget> list = [];
    day.dish.forEach((d) => list.add(_dish(context, d)));
    return list;
  }
}
