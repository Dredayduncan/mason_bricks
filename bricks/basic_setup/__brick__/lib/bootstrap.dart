import 'dart:async';
import 'dart:developer';
import 'package:{{project-name}}/setup/setup.dart';
import 'package:flutter/widgets.dart';
{{#use-riverpod}}
import 'package:flutter_riverpod/flutter_riverpod.dart';
{{/use-riverpod}}
{{^use-riverpod}}
import 'package:bloc/bloc.dart';
{{/use-riverpod}}


{{^use-riverpod}}
class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}
{{/use-riverpod}}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  {{^use-riverpod}}
  Bloc.observer = const AppBlocObserver();
  {{/use-riverpod}}


  // Add cross-flavor configuration here

  // register the rest of the dependencies
  await registerDependencies();

  await getIt.allReady();

  {{#use-riverpod}}
  runApp(
    ProviderScope(
    child: await builder(),
    ),
  );
  {{/use-riverpod}}
  {{^use-riverpod}}
  runApp(await builder());
  {{/use-riverpod}}

}
