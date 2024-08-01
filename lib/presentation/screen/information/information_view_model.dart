import 'package:flutter/foundation.dart';
import 'package:with_u/data/dto/user_info.dart';
import 'package:with_u/data/repository/user_info_repository.dart';
import 'package:with_u/presentation/screen/information/information_ui_state.dart';

class InformationViewModel extends ChangeNotifier {
  final UserInfoRepository _repository;
  InformationUiState _state = const InformationUiState();

  InformationUiState get state => _state;

  InformationViewModel(this._repository) {
    print('awefawe');
    _fetchUserInfo();
  }

  Future<void> _fetchUserInfo() async {
    try {
      final userInfo = await _repository.getUserInfo(0); // Assuming index 0
      if (userInfo != null) {
        print('hi');
        _state = _state.copyWith(
          name: userInfo.name,
          gender: userInfo.gender,
          age: userInfo.age,
          diagnosis: userInfo.diagnosis,
          medication: userInfo.medication,
          behavioralIssues: userInfo.behavioralIssues,
          behaviorPatterns: userInfo.behaviorPatterns,
          dailyRoutine: userInfo.dailyRoutine,
        );
        print(_state.name);
        print(_state.gender);
        _checkAllFieldsFilled();
        notifyListeners();
      }
    } catch (e) {
      _state = _state.copyWith(
        errorMessage: '정보를 불러오는 중 오류가 발생했습니다: ${e.toString()}',
      );
      notifyListeners();
    }
  }

  void updateField(String field, String value) {
    _state = _state.copyWith(
      name: field == '이름' ? value : _state.name,
      gender: field == '성별' ? value : _state.gender,
      age: field == '나이' ? value : _state.age,
      diagnosis: field == '발달장애 진단명' ? value : _state.diagnosis,
      medication: field == '현재 복용 중인 약물' ? value : _state.medication,
      behavioralIssues:
          field == '주로 발생하는 문제 행동' ? value : _state.behavioralIssues,
      behaviorPatterns:
          field == '행동 패턴 및 트리거 요인' ? value : _state.behaviorPatterns,
      dailyRoutine: field == '일상 생활 패턴' ? value : _state.dailyRoutine,
    );
    _checkAllFieldsFilled();
    notifyListeners();
  }

  void _checkAllFieldsFilled() {
    _state = _state.copyWith(
      isAllFieldsFilled: _state.name.isNotEmpty &&
          _state.gender.isNotEmpty &&
          _state.age.isNotEmpty &&
          _state.diagnosis.isNotEmpty &&
          _state.medication.isNotEmpty &&
          _state.behavioralIssues.isNotEmpty &&
          _state.behaviorPatterns.isNotEmpty &&
          _state.dailyRoutine.isNotEmpty,
    );
  }

  Future<void> saveUserInfo() async {
    if (!_state.isAllFieldsFilled) return;
    _state = _state.copyWith(isSaving: true, errorMessage: null);
    notifyListeners();
    try {
      final userInfo = UserInfo(
        name: _state.name,
        gender: _state.gender,
        age: _state.age,
        diagnosis: _state.diagnosis,
        medication: _state.medication,
        behavioralIssues: _state.behavioralIssues,
        behaviorPatterns: _state.behaviorPatterns,
        dailyRoutine: _state.dailyRoutine,
      );
      if ((await _repository.getAllUserInfo()).isEmpty) {
        await _repository.createUserInfo(userInfo);
      } else {
        await _repository.updateUserInfo(0, userInfo); // Assuming index 0
      }
      print(await _repository.getUserInfo(0));
      _state = _state.copyWith(isSaving: false);
    } catch (e) {
      _state = _state.copyWith(
        isSaving: false,
        errorMessage: '저장 중 오류가 발생했습니다: ${e.toString()}',
      );
    }
    notifyListeners();
  }
}
