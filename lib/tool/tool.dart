import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

bool isMoney(String value) {
  log('money $value');
  try {
    String data = value.replaceAll(',', '').trim();
    log('money $data');
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
  RegExp(r'à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ'),
  RegExp(r'À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ'),
  RegExp(r'è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ'),
  RegExp(r'È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ'),
  RegExp(r'ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ'),
  RegExp(r'Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ'),
  RegExp(r'ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ'),
  RegExp(r'Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ'),
  RegExp(r'ì|í|ị|ỉ|ĩ'),
  RegExp(r'Ì|Í|Ị|Ỉ|Ĩ'),
  RegExp(r'đ'),
  RegExp(r'Đ'),
  RegExp(r'ỳ|ý|ỵ|ỷ|ỹ'),
  RegExp(r'Ỳ|Ý|Ỵ|Ỷ|Ỹ')
];

String unsigned(final String text) {
  var result = text;
  for (var i = 0; i < _vietnamese.length; ++i) {
    result = result.replaceAll(_vietnameseRegex[i], _vietnamese[i]);
  }
  return result;
}
