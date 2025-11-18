import 'package:form_task/core/domain/repository/theme_repository.dart';
import 'package:form_task/core/presentation/navigation/router_configuration.dart';
import 'package:form_task/feature/form_page/domain/cubit/form_cubit.dart';
import 'package:form_task/feature/form_page/domain/repository/form_repository.dart';
import 'package:form_task/feature/form_page/domain/repository/form_repository_impl.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
Future<void> initDI() async {
  await _registerUtils();
  _registerCubits();
}

Future<void> _registerUtils() async {
  //can be register repositories too in this case, this is just a pattern.
  getIt
    ..registerSingleton<ThemeRepository>(ThemeRepository())
    ..registerSingleton<RouterConfiguration>(RouterConfiguration())
    ..registerSingleton<FormRepository>(FormRepositoryImpl());
}

void _registerCubits() {
  getIt.registerLazySingleton<FormCubit>(() => FormCubit(getIt<FormRepository>()));
  //.registerLazySingleton<MainPageCubit>(() => MainPageCubit());
}
