import 'package:easy_localization/easy_localization.dart';
import 'package:form_task/generated/locale_keys.g.dart';

enum FormStep {
  stepOne,
  stepTwo;

  bool get isLastStep => this == FormStep.stepTwo;

  String get buttonText {
    return switch (this) {
      FormStep.stepOne => LocaleKeys.buttons_nextStep.tr(),
      FormStep.stepTwo => LocaleKeys.buttons_save.tr(),
    };
  }
}
