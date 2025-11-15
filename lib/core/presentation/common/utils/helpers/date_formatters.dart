import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DateFormatters {
  static String formatForHearingCard(DateTime date) {
    var formatted = DateFormat('dd. MMM yyyy').format(date);
    final now = DateTime.now();
    if (DateUtils.isSameDay(date, now)) {
      formatted = '$formatted, ${'main_screen.today'.tr()}';
    }
    return formatted.toUpperCase();
  }

  static String formatHearingDate(DateTime date) {
    return DateFormat('MMMM d, yyyy').format(date);
  }

  static String formatSingleHearingDate(DateTime date) {
    return DateFormat('MMMM d, y').format(date);
  }

  static String formatTimestamp(DateTime? dt) {
    if (dt == null) return '';
    try {
      return DateFormat('d MMM yyyy, HH:mm').format(dt.toLocal());
    } on Exception catch (e) {
      return 'Invalid Date, $e';
    }
  }
}
