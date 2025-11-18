import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:form_task/feature/form_page/domain/model/form_model.dart';
import 'package:form_task/feature/form_page/domain/repository/form_repository.dart';
import 'form_state.dart';

class FormCubit extends Cubit<FormState> {
  final FormRepository _formRepository;

  FormCubit(this._formRepository) : super(const FormState.initial());

  Future<void> submitForm(FormModel model) async {
    emit(const FormState.loading());
    try {
      await _formRepository.submitForm(model);
      emit(const FormState.success());
    } on DioException catch (e) {
      final code = e.response?.statusCode;
      final message = e.response?.statusMessage ?? 'Connection error';
      emit(FormState.error(message: message, code: code));
    } catch (e) {
      emit(FormState.error(message: e.toString()));
    }
  }
}
