import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

class Earthqueke {
  final DateTime _dt;
  final String _place;
  final Decimal _power;

  Earthqueke(this._dt, this._place, this._power);

  String get dt {
    var format = DateFormat('MMMMd y').add_jm();

    return format.format(_dt);
  }

  String get place => _place;

  String get power => _power.toString();

  String powerAndplace() => "M $power - $place";
}
