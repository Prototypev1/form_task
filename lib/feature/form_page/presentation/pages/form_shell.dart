import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_task/core/presentation/common/styles/custom_text_styles.dart';
import 'package:form_task/core/presentation/common/widgets/buttons/custom_button.dart';
import 'package:form_task/feature/form_page/presentation/form_step.dart';
import 'package:form_task/feature/form_page/presentation/widgets/form_step_one.dart';
import 'package:form_task/feature/form_page/presentation/widgets/form_step_two.dart';
import 'package:form_task/generated/locale_keys.g.dart';
import 'package:go_router/go_router.dart';

class FormShell extends StatefulWidget {
  static const pageName = 'form-shell';

  const FormShell({super.key});

  @override
  State<FormShell> createState() => _FormShellState();
}

class _FormShellState extends State<FormShell> {
  final PageController _pageController = PageController();
  FormStep _currentStep = FormStep.stepOne;

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _activityController = TextEditingController();
  final _locationController = TextEditingController();
  final _dateController = TextEditingController();
  final _durationController = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _activityController.dispose();
    _locationController.dispose();
    _dateController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  void _onMainButtonPressed() {
    if (_currentStep == FormStep.stepOne) {
      _pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      setState(() => _currentStep = FormStep.stepTwo);
    } else {
      print('api');
    }
  }

  void _onBackButtonPressed() {
    if (_currentStep == FormStep.stepTwo) {
      _pageController.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      setState(() => _currentStep = FormStep.stepOne);
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: _currentStep == FormStep.stepTwo
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: _onBackButtonPressed,
              )
            : null,
        title: Text(
          LocaleKeys.input_fields_activity.tr(),
          style: CustomTextStyles.of(context).medium16.copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Divider(height: 1),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                FormStepOne(
                  nameController: _nameController,
                  descirptionController: _descriptionController,
                ),
                FormStepTwo(
                  activityController: _activityController,
                  locationController: _locationController,
                  dateController: _dateController,
                  durationController: _durationController,
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            child: SafeArea(
              child: CustomButton(
                text: _currentStep.buttonText,
                isLoading: false,
                suffixIcon: _currentStep == FormStep.stepOne ? Icons.arrow_forward : null,
                onPressed: _onMainButtonPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
