import 'package:flutter/material.dart';
import 'package:gf_troca_almoco/pages/home/min_header_widget.dart';
import 'package:gf_troca_almoco/pages/home/header.widget.dart';

//headerWeek(context, bloc)

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this._minHeight, this._maxHeight, this.bloc);

//  final Widget _widget;
  final bloc;
  final double _minHeight;
  final double _maxHeight;

  @override
  double get minExtent => _minHeight;

  @override
  double get maxExtent => _maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {

    return shrinkOffset > 0 ? minHeader(context, bloc) : headerWeek(context, bloc);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}