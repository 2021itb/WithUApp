import 'package:freezed_annotation/freezed_annotation.dart';

part 'information_ui_state.freezed.dart';
part 'information_ui_state.g.dart';

@freezed
class InformationUiState with _$InformationUiState {
  const factory InformationUiState({
    @Default('') String name,
    @Default('') String gender,
    @Default('') String age,
    @Default('') String diagnosis,
    @Default('') String medication,
    @Default('') String behavioralIssues,
    @Default('') String behaviorPatterns,
    @Default('') String dailyRoutine,
    @Default(false) bool isAllFieldsFilled,
    @Default(false) bool isSaving,
    String? errorMessage,
  }) = _InformationUiState;

  factory InformationUiState.fromJson(Map<String, Object?> json) =>
      _$InformationUiStateFromJson(json);
}