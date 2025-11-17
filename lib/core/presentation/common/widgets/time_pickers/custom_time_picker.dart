import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:form_task/core/presentation/common/styles/custom_colors.dart';
import 'package:form_task/core/presentation/common/styles/custom_text_styles.dart';

class CustomTimePicker extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;

  const CustomTimePicker({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
  });

  Future<void> _selectDateAndTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: CustomColors.of(context).primaryText,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate == null) return;

    if (!context.mounted) return;
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: CustomColors.of(context).primaryText,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime == null) return;

    final DateTime finalDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    controller.text = DateFormat('dd.MM.yyyy HH:mm').format(finalDateTime);
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
          labelText,
          style: CustomTextStyles.of(context).medium14,
        ),
        const SizedBox(height: 8),
        Container(
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
            readOnly: true,
            onTap: () => _selectDateAndTime(context),
            style: CustomTextStyles.of(context).medium14,
            cursorColor: borderColor,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: theme.inputDecorationTheme.hintStyle,
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              enabledBorder: borderStyle,
              focusedBorder: borderStyle,
              border: borderStyle,
            ),
          ),
        ),
      ],
    );
  }
}
