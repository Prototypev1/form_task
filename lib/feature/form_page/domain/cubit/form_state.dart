import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/feature/form_page/domain/cubit/form_state.freezed.dart';

//initial is not really needed but i've started using it as a pattern.

@freezed
class FormState with _$FormState {
  const factory FormState.initial() = FormStateInitial;
  const factory FormState.loading() = FormStateLoading;
  const factory FormState.success() = FormStateSuccess;
  const factory FormState.error({String? message, int? code}) = FormStateError;
}
