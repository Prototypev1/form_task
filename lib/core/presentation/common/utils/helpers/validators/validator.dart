import 'package:form_task/types.dart';

FieldValidator emailFieldValidator(String errMsg) {
  return (String? value) {
    if (value == null) return null;
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regex = RegExp(pattern);

    return !regex.hasMatch(value.trim()) ? errMsg : null;
  };
}
