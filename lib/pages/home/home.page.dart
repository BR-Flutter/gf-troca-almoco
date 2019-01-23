import 'package:flutter/material.dart';
import 'package:gf_troca_almoco/pages/home/border.clipper.dart';
import 'package:gf_troca_almoco/pages/home/home.provider.dart';
import 'package:gf_troca_almoco/pages/home/home.model.dart';
import 'package:gf_troca_almoco/pages/home/header.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc bloc;
  GlobalKey key = new GlobalKey();

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
        key: key,
        backgroundColor: Colors.green[400],
        appBar: AppBar(
          title: Text('Home'),
          elevation: 0.0,
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[Text('Trocas')],
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
              ),
            ),
            ListTile(
                title:
                    Text('Home', style: Theme.of(context).textTheme.display1)),
            ListTile(
                title:
                    Text('Sair', style: Theme.of(context).textTheme.display1))
          ],
        )),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ClipPath(
              clipper: BorderClipper(),
              child: Container(
                color: Colors.green[400],
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    headerWeek(context, bloc)
                  ],
                ),
              ),
            ),
            Flexible(
                fit: FlexFit.loose,
                child: Container(
                  color: Colors.green[400],
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: PageView(
                      controller: bloc.pageController,
                      onPageChanged: (page) {
                        bloc.setPage(page);
                      },
                      children: <Widget>[
                        ListView.builder(
                          itemCount: Day.fromJSON(bloc.response[0]).dish.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _dish(context,
                                Day.fromJSON(bloc.response[0]).dish[index]);
                          },
                        ),
                        ListView.builder(
                          itemCount: Day.fromJSON(bloc.response[1]).dish.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _dish(context,
                                Day.fromJSON(bloc.response[1]).dish[index]);
                          },
                        ),
                        ListView.builder(
                          itemCount: Day.fromJSON(bloc.response[2]).dish.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _dish(context,
                                Day.fromJSON(bloc.response[2]).dish[index]);
                          },
                        ),
                        ListView.builder(
                          itemCount: Day.fromJSON(bloc.response[3]).dish.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _dish(context,
                                Day.fromJSON(bloc.response[3]).dish[index]);
                          },
                        ),
                        ListView.builder(
                          itemCount: Day.fromJSON(bloc.response[4]).dish.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _dish(context,
                                Day.fromJSON(bloc.response[4]).dish[index]);
                          },
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
                  Text(dish.name, style: Theme.of(context).textTheme.display1),
                  Text(_dishType(dish.type),
                      style: Theme.of(context).textTheme.display2),
                ],
              ),
              _dishSwap(context, dish.swap)
            ],
          )),
    );
  }

  Widget _dishSwap(BuildContext context, bool swap) {
    if (swap == true) {
      return IconButton(
        icon: Icon(Icons.autorenew),
        onPressed: () {
          showModal(context);
        },
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

  showModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Prato Principal'),
                  subtitle: Text('Frango Frito'),
                ),
                ListTile(
                  title: Text('Alternativo I'),
                  subtitle: Text('Ovo Frito'),
                )
              ],
            ),
          );
        });
  }
}
