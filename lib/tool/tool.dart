import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:money/enum/transaction_for/transaction_for.dart';

bool isMoney(String value) {
  try {
    String data = value.replaceAll(',', '').trim();
    int.parse(data);
  } on Exception catch (_) {
    return false;
  }
  return true;
}

String convertTime(String format, int time, bool isUTC) {
  initializeDateFormatting();
  return DateFormat(format, 'vi').format(
    DateTime.fromMillisecondsSinceEpoch(
      time,
      isUtc: isUTC,
    ),
  );
}

String moneyFormat(int param, {String unit = 'đ'}) {
  final NumberFormat formatCurrency = NumberFormat();
  String result = formatCurrency.format(param);
  result = result.replaceAll(',', '.');
  return '$result $unit';
}

String moneyTextFormat(String param, {String unit = 'đ'}) {
  int data = 0;
  try {
    data = int.parse(param);
  } catch (e) {
    data = 0;
  }

  final NumberFormat formatCurrency = NumberFormat();
  String result = formatCurrency.format(data);
  result = result.replaceAll(',', '.');
  return '$result $unit';
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

const _vietnamese = 'aAeEoOuUiIdDyY';
final _vietnameseRegex = <RegExp>[
  RegExp(r'[àáạảãâầấậẩẫăằắặẳẵ]'),
  RegExp(r'[ÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴ]'),
  RegExp(r'[èéẹẻẽêềếệểễ]'),
  RegExp(r'[ÈÉẸẺẼÊỀẾỆỂỄ]'),
  RegExp(r'[òóọỏõôồốộổỗơờớợởỡ]'),
  RegExp(r'[ÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠ]'),
  RegExp(r'[ùúụủũưừứựửữ]'),
  RegExp(r'[ÙÚỤỦŨƯỪỨỰỬỮ]'),
  RegExp(r'[ìíịỉĩ]'),
  RegExp(r'[ÌÍỊỈĨ]'),
  RegExp(r'đ'),
  RegExp(r'Đ'),
  RegExp(r'[ỳýỵỷỹ]'),
  RegExp(r'[ỲÝỴỶỸ]')
];

String unsigned(final String text) {
  var result = text;
  for (var i = 0; i < _vietnamese.length; ++i) {
    result = result.replaceAll(_vietnameseRegex[i], _vietnamese[i]);
  }
  return result;
}

String textByGoal(int type) {
  switch (type) {
    case TransactionFor.all:
      return 'Chung';
    case TransactionFor.quyen:
      return 'Quyên';
    case TransactionFor.thanh:
      return 'Thành';
    default:
      return 'Chung';
  }
}
Color colorByGoal(int type) {
  switch (type) {
    case TransactionFor.all:
      return Colors.red;
    case TransactionFor.quyen:
      return Colors.blue;
    case TransactionFor.thanh:
      return Colors.green;
    default:
      return Colors.red;
  }
}
