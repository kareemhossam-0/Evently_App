import 'package:intl/intl.dart';

extension DateFormate on DateTime {
  String get getMonthFormDateTime {
    DateFormat formatter = DateFormat("MMMM"); // pattern
    return formatter.format(this);
  }

  String get toFormattedDate {
    DateFormat formatter = DateFormat("dd-MM-yyyy"); // pattern
    return formatter.format(this);
  }

  String get getTime {
    DateFormat formatter = DateFormat("hh:mm"); // pattern
    return formatter.format(this);
  }
}