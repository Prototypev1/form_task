import 'package:flutter/material.dart';
import 'package:form_task/core/presentation/common/styles/custom_colors.dart';
import 'package:form_task/core/presentation/common/styles/custom_text_styles.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final double? height;

  const CustomFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = CustomColors.of(context).primaryText;

    final borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: borderColor),
    );

    final fillColor = Colors.white;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: CustomTextStyles.of(context).medium14),
        const SizedBox(height: 8),
        SizedBox(
          height: height ?? MediaQuery.sizeOf(context).height * 0.55,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: -2,
                ),
              ],
            ),
            child: TextFormField(
              controller: controller,
              expands: true,
              maxLines: null,
              minLines: null,
              textAlignVertical: TextAlignVertical.top,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
              style: CustomTextStyles.of(context).medium14,
              cursorColor: borderColor,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: theme.inputDecorationTheme.hintStyle,
                filled: true,
                fillColor: fillColor,
                contentPadding: const EdgeInsets.all(16),
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
                errorBorder: borderStyle.copyWith(
                  borderSide: BorderSide(color: theme.colorScheme.error),
                ),
                focusedErrorBorder: borderStyle.copyWith(
                  borderSide: BorderSide(color: theme.colorScheme.error),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
