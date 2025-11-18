import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/feature/form_page/domain/model/form_model.freezed.dart';
part '../../../../generated/feature/form_page/domain/model/form_model.g.dart';

//rough example how would i use freezed, but i would also use @JsonKeys and additional things if they were needed.

@freezed
abstract class FormModel with _$FormModel {
  const factory FormModel({
    required String name,
    required String description,
    required String? activity,
    required String location,
    required DateTime dateTime,
    required String? duration,
  }) = _FormModel;

  factory FormModel.fromJson(Map<String, dynamic> json) => _$FormModelFromJson(json);
}
