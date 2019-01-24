import 'package:flutter/material.dart';
import 'package:gf_troca_almoco/pages/home/border.clipper.dart';
import 'package:gf_troca_almoco/pages/home/home.provider.dart';
import 'package:gf_troca_almoco/pages/home/home.model.dart';
import 'package:gf_troca_almoco/pages/home/header.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin  {
  HomeBloc bloc;
  GlobalKey key = new GlobalKey();
//  TabController _tabController;

  @override
  void initState() {
    super.initState();
  }

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
    bloc.tabController = new TabController(length: 5, vsync: this);

    return Scaffold(
      body: DefaultTabController(
          length: 5,
          child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsCrolled) {
                return <Widget>[
                  SliverAppBar(
                    pinned: true,
                    elevation: 0.0,
                    title: Text('Cardipio'),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                        80.0, 160.0, headerWeek(context, bloc)),
                    pinned: true,
                  ),
                ];
              },
              body: Container(
                color: Colors.green[300],
                child: TabBarView(
                  controller: bloc.tabController,
                    children: <Widget>[
                      TabView(0),
                      TabView(1),
                      TabView(2),
                      TabView(3),
                      TabView(4),
                    ]),
              ))),
    );
  }

  Widget TabView(int day) {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: Day.fromJSON(bloc.response[day]).dish.length,
      itemBuilder: (BuildContext context, int index) {
        return _dish(context, Day.fromJSON(bloc.response[day]).dish[index]);
      },
    );
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._minHeight, this._maxHeight, this._widget);

  final Widget _widget;
  final double _minHeight;
  final double _maxHeight;

  @override
  double get minExtent => _minHeight;

  @override
  double get maxExtent => _maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print('build $shrinkOffset');
    print('build $overlapsContent');

    return shrinkOffset > 0
        ? Container(
            constraints: BoxConstraints.expand(),
            color: Colors.green[800],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'SEG',
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w500),
                    ),
                    Text('21', style: TextStyle(fontSize: 28.0))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'TER',
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w500),
                    ),
                    Text('22', style: TextStyle(fontSize: 28.0))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'QUA',
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w500),
                    ),
                    Text('23', style: TextStyle(fontSize: 28.0))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'QUI',
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w500),
                    ),
                    Text('24', style: TextStyle(fontSize: 28.0))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'SEX',
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w500),
                    ),
                    Text('25', style: TextStyle(fontSize: 28.0))
                  ],
                ),
              ],
            ),
          )
        : _widget;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
