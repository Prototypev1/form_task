import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Helper {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'text_fields.email_required'.tr().toUpperCase();
    }

    final regex = RegExp(
      r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
    if (!regex.hasMatch(value)) {
      return 'text_fields.wrong_email'.tr().toUpperCase();
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'text_fields.name_required'.tr().toUpperCase();
    }
    final regex = RegExp(r'^[A-Za-z]+$');
    if (!regex.hasMatch(value)) {
      return 'text_fields.name_invalid'.tr().toUpperCase();
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'text_fields.phone_required'.tr().toUpperCase();
    }
    final regex = RegExp(r'^\d{6,}$');
    if (!regex.hasMatch(value)) {
      return 'text_fields.phone_invalid'.tr().toUpperCase();
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'text_fields.password_required'.tr().toUpperCase();
    }

    if (value.length < 8 || value.length > 50) {
      return 'text_fields.password_length'.tr().toUpperCase();
    }

    const specialChars = r'!£$%&@?#~';
    var digitCount = 0;
    var lowerCount = 0;
    var upperCount = 0;
    var specialCount = 0;

    for (var i = 0; i < value.length; i++) {
      final char = value[i];
      if (specialChars.contains(char)) {
        specialCount++;
      } else if (char.codeUnitAt(0) >= 48 && char.codeUnitAt(0) <= 57) {
        digitCount++;
      } else if (char.codeUnitAt(0) >= 65 && char.codeUnitAt(0) <= 90) {
        upperCount++;
      } else if (char.codeUnitAt(0) >= 97 && char.codeUnitAt(0) <= 122) {
        lowerCount++;
      }
    }

    final groupCount =
        (digitCount > 0 ? 1 : 0) + (lowerCount > 0 ? 1 : 0) + (upperCount > 0 ? 1 : 0) + (specialCount > 0 ? 1 : 0);
    if (groupCount < 3) {
      return 'text_fields.password_complexity'.tr().toUpperCase();
    }
    return null;
  }

  static String? validateCodes(String? value) {
    if (value == null || value.isEmpty || value.length != 4) {
      return 'text_fields.wrong_code'.tr().toUpperCase();
    } else {
      return null;
    }
  }

  static DateTime? parseDate(String dateText) => DateTime.tryParse(dateText);

  static TimeOfDay parseToTimeOfDay(String timeOfDayString) {
    return TimeOfDay(hour: int.parse(timeOfDayString.split(':')[0]), minute: int.parse(timeOfDayString.split(':')[1]));
  }

  static String timeOfDayToString(TimeOfDay tod) => tod.toString();
}
