import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:form_task/core/presentation/navigation/router_configuration.dart';
import 'package:form_task/di/di.dart';
import 'package:form_task/generated/codegen_loader.g.dart';
import 'package:logger_service/logger_service.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  _initLogger();

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();

      await initDI();
      getIt.get<RouterConfiguration>().init();

      runApp(
        EasyLocalization(
          assetLoader: const CodegenLoader(),
          supportedLocales: const [Locale('en')],
          path: 'assets/localization',
          fallbackLocale: const Locale('sr'),
          child: await builder(),
        ),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

void _initLogger() {
  Log.tag = 'Forms task';
}
