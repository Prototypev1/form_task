import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_task/constants.dart';
import 'package:form_task/core/presentation/common/styles/custom_colors.dart';
import 'package:form_task/core/presentation/common/widgets/dropdowns/custom_dropdown.dart';
import 'package:form_task/core/presentation/common/widgets/input_fields/custom_input_field.dart';
import 'package:form_task/core/presentation/common/widgets/time_pickers/custom_time_picker.dart';
import 'package:form_task/generated/locale_keys.g.dart';

class FormStepTwo extends StatelessWidget {
  final TextEditingController activityController;
  final TextEditingController locationController;
  final TextEditingController dateController;
  final TextEditingController durationController;

  const FormStepTwo({
    super.key,
    required this.activityController,
    required this.locationController,
    required this.dateController,
    required this.durationController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CustomDropdown(
            controller: activityController,
            labelText: LocaleKeys.input_fields_activity.tr(),
            options: activityDropdownList,
          ),
          const SizedBox(height: 16),
          CustomInputField(
            controller: locationController,
            labelText: LocaleKeys.input_fields_location.tr(),
            suffixIcon: const Icon(Icons.location_on_outlined),
            enabledBorderColor: CustomColors.of(context).primaryText,
            disabledBorderColor: CustomColors.of(context).primaryText,
            filled: true,
            focusedBorderColor: CustomColors.of(context).primaryText,
          ),
          const SizedBox(height: 16),
          CustomTimePicker(
            controller: dateController,
            labelText: LocaleKeys.input_fields_dateAndTime.tr(),
          ),
          const SizedBox(height: 16),
          CustomDropdown(
            controller: durationController,
            labelText: LocaleKeys.input_fields_duration.tr(),
            options: durationDropdownList,
          ),
        ],
      ),
    );
  }
}
