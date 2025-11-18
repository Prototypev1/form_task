import 'package:form_task/feature/form_page/domain/model/form_model.dart';

//just a regular abstract class to access all the impl funcs

abstract class FormRepository {
  Future<void> submitForm(FormModel form);
}
