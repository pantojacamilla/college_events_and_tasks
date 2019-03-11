import 'package:intl/intl.dart';

String dateFormatted() {
  var now = DateTime.now();

  var formatter = new DateFormat("EEE, d MMM, yyyy");   // ("EEE, MMM d, ''yy") formato norte americano
  String formatted = formatter.format(now);

  return formatted;
}