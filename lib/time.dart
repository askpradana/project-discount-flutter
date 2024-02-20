import 'package:intl/intl.dart';

class Converter {
  String time(DateTime time) {
    return DateFormat('dd MM yyyy').format(time);
  }
}
