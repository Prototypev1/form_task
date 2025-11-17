import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final Color? textColor;
  const CustomLoadingIndicator({super.key, this.textColor});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 2,
      valueColor: AlwaysStoppedAnimation<Color>(textColor ?? Colors.white),
    );
  }
}
