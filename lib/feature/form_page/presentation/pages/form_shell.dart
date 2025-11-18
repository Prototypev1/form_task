import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' hide FormState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_task/core/presentation/common/styles/custom_text_styles.dart';
import 'package:form_task/core/presentation/common/widgets/buttons/custom_button.dart';
import 'package:form_task/di/di.dart';
import 'package:form_task/feature/form_page/domain/cubit/form_cubit.dart';
import 'package:form_task/feature/form_page/domain/cubit/form_state.dart';
import 'package:form_task/feature/form_page/domain/model/form_model.dart';
import 'package:form_task/feature/form_page/presentation/form_step.dart';
import 'package:form_task/feature/form_page/presentation/widgets/form_step_one.dart';
import 'package:form_task/feature/form_page/presentation/widgets/form_step_two.dart';
import 'package:form_task/generated/locale_keys.g.dart';
import 'package:go_router/go_router.dart';

//this form can be in multiple ways, switch, different page and passing args through router, pageview, enum etc,
//i went with simpler but an okay way since the complete codebase is already pretty complex for a task of these proportions
class FormShell extends StatefulWidget {
  static const pageName = 'form-shell';

  const FormShell({super.key});

  @override
  State<FormShell> createState() => _FormShellState();
}

class _FormShellState extends State<FormShell> {
  final PageController _pageController = PageController();
  late final FormCubit _formCubit;

  //enum could be in this file too as we dont use it anywhere else in the project but ye
  FormStep _currentStep = FormStep.stepOne;

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _activityController = TextEditingController();
  final _locationController = TextEditingController();
  final _dateController = TextEditingController();
  final _durationController = TextEditingController();

  @override
  void initState() {
    _formCubit = getIt<FormCubit>();
    super.initState();
  }

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

  //this can be separated in common as we could use this in a common widget folder
  void _showSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  //helpers for datetime
  DateTime _parseDate(String dateStr) {
    if (dateStr.isEmpty) return DateTime.now();
    try {
      return DateFormat('dd.MM.yyyy HH:mm').parse(dateStr);
    } catch (e) {
      return DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FormCubit, FormState>(
      bloc: _formCubit,
      listener: (context, state) {
        if (state is FormStateSuccess) {
          _showSnackbar(context, 'Saved', Colors.lightGreen);
        }
        if (state is FormStateError) {
          Color color = Colors.red;
          _showSnackbar(context, '${state.code}: ${state.message ?? 'Unknown error'}', color);
        }
      },
      builder: (context, state) {
        //this logic shouldnt be here as i dont like the approach but again, sa i said, time ive spent became big
        //loading bool is fine, onmainbuttonpressed would been moved to cubit as i like that alot better, but this can be faster.
        final bool isLoading = state is FormStateLoading;

        void onMainButtonPressed() {
          if (_currentStep == FormStep.stepOne) {
            _pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            setState(() => _currentStep = FormStep.stepTwo);
          } else {
            //cubit as i said
            final model = FormModel(
              name: _nameController.text,
              description: _descriptionController.text,
              activity: _activityController.text.isEmpty ? null : _activityController.text,
              location: _locationController.text,
              dateTime: _parseDate(_dateController.text),
              duration: _durationController.text.isEmpty ? null : _durationController.text,
            );
            _formCubit.submitForm(model);
          }
        }

        void onBackButtonPressed() {
          if (_currentStep == FormStep.stepTwo) {
            _pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            setState(() => _currentStep = FormStep.stepOne);
          } else {
            context.pop();
          }
        }

        return SafeArea(
          child: Scaffold(
            //this wouldnt have been done like this, but i guess its fine for testing purposes
            resizeToAvoidBottomInset: false,
            //this app bar in my opinion wouldnt be an app bar but a custom widget, but i just realized how much time ive spent on this
            //to show the complete architecture of what i would be doing in a large-scale projects roughly.
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: _currentStep == FormStep.stepTwo
                  //these icons and iconbuttons woudl be a custom widget as a svg/png image, but for this case its just added to show the
                  //suffix icons on each field properly.
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: onBackButtonPressed,
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
                //ideally this would be disabled in step 1 as i would place the guard for that, isLoading bool would be picked up
                //from the state and present a custom indicator, but as im too lazy to mock everything properly, ill leave it enabled
                //and based on the fields remaining empty ( thats why its constantly enabled ) - will simulate the api call ( step 2 tho ).
                Container(
                  padding: const EdgeInsets.all(16),
                  child: CustomButton(
                    text: _currentStep.buttonText,
                    isLoading: isLoading,
                    suffixIcon: _currentStep == FormStep.stepOne ? Icons.arrow_forward : null,
                    onPressed: () => onMainButtonPressed(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
