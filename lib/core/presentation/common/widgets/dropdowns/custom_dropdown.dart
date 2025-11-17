import 'package:flutter/material.dart';
import 'package:form_task/core/presentation/common/styles/custom_colors.dart';
import 'package:form_task/core/presentation/common/styles/custom_text_styles.dart';

class CustomDropdown extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final List<String> options;
  final String? hintText;
  final double height;

  const CustomDropdown({
    super.key,
    required this.labelText,
    required this.controller,
    required this.options,
    this.hintText,
    this.height = 50,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _currentValue;

  @override
  void initState() {
    super.initState();
    if (widget.controller.text.isNotEmpty && widget.options.contains(widget.controller.text)) {
      _currentValue = widget.controller.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = CustomColors.of(context).primaryText;

    final borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: borderColor),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: CustomTextStyles.of(context).medium14,
        ),
        const SizedBox(height: 8),
        Container(
          height: widget.height,
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
          child: DropdownButtonFormField<String>(
            initialValue: _currentValue,
            items: widget.options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: CustomTextStyles.of(context).medium14,
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _currentValue = newValue;
                if (newValue != null) {
                  widget.controller.text = newValue;
                }
              });
            },
            icon: Icon(Icons.arrow_downward, size: 20, color: borderColor),
            isExpanded: true,
            dropdownColor: Colors.white,
            style: CustomTextStyles.of(context).medium14,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: theme.inputDecorationTheme.hintStyle,
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              enabledBorder: borderStyle,
              focusedBorder: borderStyle,
              border: borderStyle,
              errorStyle: const TextStyle(height: 0),
            ),
          ),
        ),
      ],
    );
  }
}
