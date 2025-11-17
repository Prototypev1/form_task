import 'package:flutter/material.dart';
import 'package:form_task/core/presentation/common/styles/custom_colors.dart';
import 'package:form_task/core/presentation/common/styles/custom_text_styles.dart';

class ThemeRepository {
  CustomColorScheme get _colorScheme => CustomColorScheme.classic();
  String? _appLogoSvgUrl;

  String? get appLogoSvgUrl => _appLogoSvgUrl;

  ThemeData buildTheme() {
    final currentScheme = _colorScheme;

    final textStyleScheme = CustomTextStyleScheme.fromPrimaryTextColor(primaryTextColor: currentScheme.primaryText!);
    return ThemeData(
      scaffoldBackgroundColor: currentScheme.primary,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(backgroundColor: currentScheme.primary),
      extensions: <ThemeExtension<dynamic>>[currentScheme, textStyleScheme],
    );
  }
}
