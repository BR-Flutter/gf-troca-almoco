import 'package:flutter/material.dart';
import 'package:gf_troca_almoco/pages/home/home.model.dart';

Widget dish(BuildContext context, Dish dish) {
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
                Text(dishType(dish.type),
                    style: Theme.of(context).textTheme.display2),
              ],
            ),
            dishSwap(context, dish.swap)
          ],
        )),
  );
}

String dishType(int type) {
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

Widget dishSwap(BuildContext context, bool swap) {
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
