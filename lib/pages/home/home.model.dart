import 'package:gf_troca_almoco/pages/home/home.provider.dart';

class Day extends Object {
  String mes;
  int numeroDia;
  String nomeDia;

  Day(String this.mes, int this.numeroDia, String this.nomeDia);

  Day.fromJSON(Map<dynamic, dynamic> json)
      : mes = json['mes'],
        numeroDia = json['numeroDia'],
        nomeDia = json['nomeDia'];
}
