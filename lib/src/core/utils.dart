import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int getTimestamp() => DateTime.now().millisecondsSinceEpoch ~/ 1000;

String timestampToString(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat('dd.MM.yyyy').format(date); // timestamp to 22.06.2000
}

String dateToString(DateTime date) {
  return DateFormat('dd.MM.yyyy').format(date); // DateTime to 22.06.2000
}

String timeToString(DateTime time) {
  return DateFormat('HH:mm').format(time); // DateTime to 22:00
}

DateTime stringToDate(String date) {
  return DateFormat('dd.MM.yyyy').parse(date); // 22.06.2000 to DateTime
}

String formatNumber(int number) {
  return NumberFormat('#,###').format(number);
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double getBottom(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

void logger(Object message) => developer.log(message.toString());

void precacheImages(BuildContext context) {
  List<String> imageAssets = [
    // 'assets/.png',
  ];
  try {
    for (String assets in imageAssets) {
      precacheImage(AssetImage(assets), context);
    }
  } catch (e) {
    logger(e);
  }
}
