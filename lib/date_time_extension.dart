import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toFormattedString(format) {
    var date = DateFormat(format, "ja_JP").format(this);
    return date;
  }
}
