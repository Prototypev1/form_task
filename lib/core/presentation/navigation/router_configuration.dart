import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:form_task/feature/form_page/presentation/pages/form_shell.dart';
import 'package:go_router/go_router.dart';

class RouterConfiguration {
  RouterConfiguration();

  late final GoRouter _goRouter;

  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

  GoRouter get router => _goRouter;

  void init() {
    _goRouter = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: '/${FormShell.pageName}',
      debugLogDiagnostics: kDebugMode,
      routes: <RouteBase>[
        GoRoute(
          path: '/${FormShell.pageName}',
          name: FormShell.pageName,
          pageBuilder: (context, state) => _getPage(key: state.pageKey, child: const FormShell()),
        ),
      ],
    );
  }

  Page<dynamic> _getPage({required ValueKey<dynamic> key, required Widget child}) {
    if (kIsWeb) {
      return NoTransitionPage(key: key, child: child);
    }
    if (Platform.isAndroid) {
      return NoTransitionPage(key: key, child: child);
    } else {
      return CupertinoPage(key: key, child: child);
    }
  }
}
