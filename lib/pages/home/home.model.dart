class Day extends Object {
  String mes;
  int numeroDia;
  String nomeDia;
  List<Dish> dish = [];

  Day(String this.mes, int this.numeroDia, String this.nomeDia);

  Day.fromJSON(Map<dynamic, dynamic> json) {
    this.mes = json['mes'];
    this.numeroDia = json['numeroDia'];
    this.nomeDia = json['nomeDia'];

    List<Map> jsonDish = json['dish'];
    if (jsonDish.isNotEmpty && jsonDish.length > 0) {
      jsonDish.forEach((el) => this.dish.add(Dish.fromJSON(el)));
    }
  }

  @override
  String toString() {
    print(this.mes);
    print(this.numeroDia);
    print(this.nomeDia);
    print(this.dish);
  }
}

class Dish extends Object {
  int type;
  String name;
  bool swap;

  Dish(this.type, this.name, this.swap);

  Dish.fromJSON(Map<dynamic, dynamic> json) {
    type = json['type'];
    name = json['name'];
    swap = json['swap'];
  }
}
