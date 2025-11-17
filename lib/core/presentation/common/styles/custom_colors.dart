import 'package:flutter/material.dart';

class CustomColors {
  const CustomColors.of(BuildContext context) : _context = context;
  final BuildContext _context;

  Color get primary => Theme.of(_context).extension<CustomColorScheme>()!.primary!;
  Color get buttonColor => Theme.of(_context).extension<CustomColorScheme>()!.buttonColor!;
  Color get primaryText => Theme.of(_context).extension<CustomColorScheme>()!.primaryText!;
}

@immutable
class CustomColorScheme extends ThemeExtension<CustomColorScheme> {
  const CustomColorScheme({
    required this.primary,
    required this.buttonColor,
    required this.primaryText,
  });

  const CustomColorScheme.classic()
    : primary = const Color(0xFFD9D9D9),
      buttonColor = const Color(0xFFC1D2F2),
      primaryText = const Color(0xFF2E2E2E);

  final Color? primary;
  final Color? buttonColor;
  final Color? primaryText;

  @override
  CustomColorScheme copyWith({
    Color? primary,
    Color? buttonColor,
    Color? primaryText,
  }) {
    return CustomColorScheme(
      primary: primary ?? this.primary,
      buttonColor: buttonColor ?? this.buttonColor,
      primaryText: primaryText ?? this.primaryText,
    );
  }

  @override
  ThemeExtension<CustomColorScheme> lerp(ThemeExtension<CustomColorScheme>? other, double t) {
    if (other is! CustomColorScheme) return this;
    return CustomColorScheme(
      primary: Color.lerp(primary, other.primary, t),
      buttonColor: Color.lerp(buttonColor, other.buttonColor, t),
      primaryText: Color.lerp(primaryText, other.primaryText, t),
    );
  }
}
