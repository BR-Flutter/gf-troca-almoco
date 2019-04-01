import 'package:flutter/material.dart';
import 'package:gf_troca_almoco/pages/home/home.provider.dart';
import 'package:gf_troca_almoco/pages/home/header.widget.dart';
import 'package:gf_troca_almoco/pages/home/tab_view_widget.dart';
import 'package:gf_troca_almoco/pages/home/silver_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
    bloc.tabController..addListener(() => {
      bloc.setPage(bloc.tabController.index)
    });

    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: Text('Pazuzu'),
        ),
      ),
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
                    delegate: SliverAppBarDelegate(
                        80.0, 160.0, bloc),
                    pinned: true,
                  ),
                ];
              },
              body: Container(
                color: Colors.green[300],
                child: TabBarView(
                    controller: bloc.tabController,
                    children: <Widget>[
                      TabView(0, bloc),
                      TabView(1, bloc),
                      TabView(2, bloc),
                      TabView(3, bloc),
                      TabView(4, bloc),
                    ]),
              ))),
    );
  }
}
