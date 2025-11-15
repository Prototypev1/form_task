import 'package:form_task/core/domain/repository/theme_repository.dart';
import 'package:form_task/core/presentation/navigation/router_configuration.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
Future<void> initDI() async {
  await _registerUtils();
  _registerCubits();
}

Future<void> _registerUtils() async {
  getIt
    ..registerSingleton<ThemeRepository>(ThemeRepository())
    ..registerSingleton<RouterConfiguration>(RouterConfiguration());
}

void _registerCubits() {
  //getIt
  //..registerLazySingleton<LoadingPageCubit>(() => LoadingPageCubit())
  //.registerLazySingleton<MainPageCubit>(() => MainPageCubit());
}
