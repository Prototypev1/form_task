import 'package:flutter/material.dart';
import 'package:form_task/core/presentation/common/styles/custom_colors.dart';
import 'package:form_task/core/presentation/common/styles/custom_text_styles.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
    this.controller,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.autofocus = false,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.borderRadius = const BorderRadius.all(Radius.circular(0)),
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.disabledBorderColor,
    this.hintStyle,
    this.textStyle,
    this.labelStyle,
    this.fillColor,
    this.filled = false,
    this.width = double.infinity,
    this.height = 50,
    this.textColor,
    this.cursorColor,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.text,
    this.suffixIconColor,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool autofocus;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final EdgeInsetsGeometry contentPadding;
  final BorderRadius borderRadius;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? disabledBorderColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final Color? fillColor;
  final bool filled;
  final double width;
  final double height;
  final Color? textColor;
  final Color? cursorColor;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Color? suffixIconColor;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> with TickerProviderStateMixin {
  final _node = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _fieldKey = GlobalKey<FormFieldState<String>>();
  bool _showError = false;
  String? _lastError;

  @override
  void initState() {
    super.initState();
    _node.addListener(() {
      final value = widget.controller?.text ?? _fieldKey.currentState?.value;
      _lastError = widget.validator?.call(value);
      if (!_node.hasFocus) {
        _showError = _lastError != null;
      } else {
        _showError = false;
      }
      _formKey.currentState?.validate();
      setState(() {});
    });
  }

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  String? _validatorProxy(String? value) {
    _lastError = widget.validator?.call(value);
    return _showError ? _lastError : null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inputTextColor = widget.textColor ?? Colors.black;
    final cursorCol = widget.cursorColor ?? inputTextColor;

    final baseEnabledBorder = OutlineInputBorder(
      borderRadius: widget.borderRadius,
      borderSide: BorderSide(color: widget.enabledBorderColor ?? theme.dividerColor),
    );
    final baseFocusedBorder = OutlineInputBorder(
      borderRadius: widget.borderRadius,
      borderSide: BorderSide(color: widget.focusedBorderColor ?? cursorCol),
    );
    final baseErrorBorder = OutlineInputBorder(
      borderRadius: widget.borderRadius,
      borderSide: BorderSide(color: widget.errorBorderColor ?? theme.colorScheme.error),
    );
    final disabledBorder = OutlineInputBorder(
      borderRadius: widget.borderRadius,
      borderSide: BorderSide(color: widget.disabledBorderColor ?? theme.disabledColor),
    );

    final useError = _showError && (_lastError != null);
    final enabledBorder = useError ? baseErrorBorder : baseEnabledBorder;
    final focusedBorder = useError ? baseErrorBorder : baseFocusedBorder;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Text(
            widget.labelText!,
            style: widget.labelStyle ?? CustomTextStyles.of(context).medium14,
          ),
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: widget.borderRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: -2,
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: TextFormField(
                key: _fieldKey,
                controller: widget.controller,
                initialValue: widget.controller == null ? widget.initialValue : null,
                keyboardType: widget.textInputType,
                textInputAction: widget.textInputAction,
                autofocus: widget.autofocus,
                enabled: widget.enabled,
                obscureText: widget.obscureText,
                style: widget.textStyle ?? TextStyle(color: inputTextColor),
                cursorColor: cursorCol,
                autovalidateMode: AutovalidateMode.disabled,
                onChanged: (v) {
                  widget.onChanged?.call(v);
                  _lastError = widget.validator?.call(v);
                  if (_node.hasFocus) {
                    _showError = _lastError != null ? false : false;
                  } else {
                    _showError = _lastError != null;
                  }
                  _formKey.currentState?.validate();
                  setState(() {});
                },
                validator: _validatorProxy,
                focusNode: _node,
                onSaved: widget.onSaved,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: widget.hintStyle ?? theme.inputDecorationTheme.hintStyle?.copyWith(color: inputTextColor),
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  contentPadding: widget.contentPadding,
                  enabledBorder: enabledBorder,
                  focusedBorder: focusedBorder,
                  errorBorder: baseErrorBorder,
                  focusedErrorBorder: baseErrorBorder,
                  disabledBorder: disabledBorder,
                  border: enabledBorder,
                  filled: widget.filled,
                  fillColor: widget.fillColor ?? Colors.white,
                  suffixIconColor: widget.suffixIconColor ?? CustomColors.of(context).primaryText,
                  errorStyle: const TextStyle(fontSize: 0, height: 0),
                  errorMaxLines: 1,
                ),
              ),
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          alignment: Alignment.topLeft,
          child: Builder(
            builder: (_) {
              final shouldShow = _showError && (_lastError != null);
              if (!shouldShow) return const SizedBox.shrink();
              return Text(
                _lastError!,
                style: CustomTextStyles.of(context).medium12.apply(color: theme.colorScheme.error),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              );
            },
          ),
        ),
      ],
    );
  }
}
