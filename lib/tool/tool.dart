import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

bool isMoney(String value) {
  try {
    int.parse(value);
  } on Exception catch (_) {
    return false;
  }
  return true;
}

String convertTime(String format, int time, bool isUTC) {
  initializeDateFormatting();
  return DateFormat(
    format,
  ).format(DateTime.fromMillisecondsSinceEpoch(time, isUtc: isUTC));
}
String moneyFormat(int param, {String unit = 'đ'}) {
  final NumberFormat formatCurrency = NumberFormat();
  String result = formatCurrency.format(param);
  result = result.replaceAll(',', '.');
  return '$result $unit';
}
