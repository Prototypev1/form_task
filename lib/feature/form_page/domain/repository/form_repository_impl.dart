import 'package:dio/dio.dart';
import 'package:form_task/feature/form_page/domain/model/form_model.dart';
import 'package:form_task/feature/form_page/domain/repository/form_repository.dart';

class FormRepositoryImpl implements FormRepository {
  //each of these ednpoitns/paths can be and would have been separated to a
  //constants file or something similar.

  //this is a rough simulation of a fake call, however dio client is basically completely setup
  //it presents all the methods, refresh token logic, how it would been used in localrepo/sharedprefs/secure storage
  //tokens, retry mechanisms etc, custom messages are also present
  @override
  Future<void> submitForm(FormModel form) async {
    await Future.delayed(const Duration(seconds: 2));

    if (form.name.isEmpty) {
      throw DioException(
        requestOptions: RequestOptions(path: '/submit'),
        response: Response(
          statusCode: 400,
          requestOptions: RequestOptions(path: '/submit'),
          statusMessage: 'validation failed',
        ),
        type: DioExceptionType.badResponse,
      );
    }

    if (form.activity == null) {
      throw DioException(
        requestOptions: RequestOptions(path: '/submit'),
        response: Response(
          statusCode: 401,
          requestOptions: RequestOptions(path: '/submit'),
          statusMessage: 'unauthorized access/activity dropdown is empty',
        ),
        type: DioExceptionType.badResponse,
      );
    }

    if (form.location.isEmpty) {
      throw DioException(
        requestOptions: RequestOptions(path: '/submit'),
        response: Response(
          statusCode: 500,
          requestOptions: RequestOptions(path: '/submit'),
          statusMessage: 'server error/locatio nis empty',
        ),
        type: DioExceptionType.badResponse,
      );
    }

    return;
  }
}
