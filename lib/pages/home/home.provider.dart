import 'package:flutter/material.dart';
import 'package:gf_troca_almoco/pages/home/home.bloc.dart';
export 'package:gf_troca_almoco/pages/home/home.bloc.dart';

class HomeBlocProvider extends InheritedWidget {
  final HomeBloc bloc;

  HomeBlocProvider({Key key, Widget child})
      : bloc = HomeBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(__) => true;

  static HomeBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(HomeBlocProvider)
            as HomeBlocProvider)
        .bloc;
  }
}
