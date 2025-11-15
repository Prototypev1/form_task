import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/core/domain/cubit/app/app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = AppStateInitial;
}
