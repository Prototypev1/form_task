import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_task/core/presentation/common/styles/custom_colors.dart';
import 'package:form_task/core/presentation/common/widgets/description/custom_form_field.dart';
import 'package:form_task/core/presentation/common/widgets/input_fields/custom_input_field.dart';
import 'package:form_task/generated/locale_keys.g.dart';

class FormStepOne extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController descirptionController;

  const FormStepOne({
    super.key,
    required this.nameController,
    required this.descirptionController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CustomInputField(
            controller: nameController,
            labelText: LocaleKeys.input_fields_label.tr(),
            enabledBorderColor: CustomColors.of(context).primaryText,
            disabledBorderColor: CustomColors.of(context).primaryText,
            filled: true,
            focusedBorderColor: CustomColors.of(context).primaryText,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: CustomFormField(
              controller: descirptionController,
              labelText: LocaleKeys.input_fields_description.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
