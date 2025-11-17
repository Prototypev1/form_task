import 'package:flutter/material.dart';
import 'package:form_task/core/presentation/common/styles/custom_colors.dart';
import 'package:form_task/core/presentation/common/styles/custom_text_styles.dart';
import 'package:form_task/core/presentation/common/widgets/loading_indicators/custom_loading_indicator.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final bool isLoading;
  final Widget? loadingWidget;
  final IconData? suffixIcon;
  final Color? suffixIconColor;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.borderRadius,
    this.height,
    this.width,
    this.padding,
    this.textStyle,
    required this.isLoading,
    this.loadingWidget,
    this.suffixIcon,
    this.suffixIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? MediaQuery.of(context).size.width,
      child: Container(
        decoration: BoxDecoration(
          color: (onPressed == null && !isLoading) ? backgroundColor : CustomColors.of(context).buttonColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          border: Border.all(color: CustomColors.of(context).primaryText),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              offset: const Offset(0, 4),
              blurRadius: 4,
              spreadRadius: -2,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          child: InkWell(
            onTap: (isLoading || onPressed == null) ? null : onPressed,
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
            splashColor: Colors.white.withValues(alpha: .3),
            highlightColor: Colors.white.withValues(alpha: .1),
            child: Padding(
              padding: padding ?? const EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                child: isLoading
                    ? loadingWidget ??
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: CustomLoadingIndicator(textColor: textColor),
                          )
                    : SizedBox(
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              text,
                              textAlign: TextAlign.center,
                              style: textStyle ?? CustomTextStyles.of(context).medium16,
                            ),
                            if (suffixIcon != null)
                              Positioned(
                                right: 0,
                                child: Icon(
                                  suffixIcon,
                                  color: suffixIconColor ?? CustomColors.of(context).primaryText,
                                  size: 26,
                                ),
                              ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
