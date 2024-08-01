import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:with_u/data/repository/chat_repository_impl.dart';
import 'package:with_u/data/repository/user_info_repository.dart';
import 'package:with_u/presentation/component/big_button.dart';
import 'package:with_u/presentation/component/name_textfield.dart';
import 'package:with_u/presentation/screen/information/information_view_model.dart';
import 'package:with_u/ui/text_styles.dart';
import 'package:with_u/ui/color_styles.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InformationViewModel(
          context.read<UserInfoRepository>(),
          context.read<ChatRepositoryImpl>()),
      child: _InformationScreenContent(),
    );
  }
}

class _InformationScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<InformationViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        toolbarHeight: 45,
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '개인정보 입력',
                  style: TextStyles.headingH3,
                ),
                const SizedBox(height: 8),
                Text(
                  '함께하기 위해 정보를 입력해주세요.',
                  style: TextStyles.bodyS,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Column(
                        children: [
                          _buildTextField(context, '이름', state.name),
                          _buildTextField(context, '성별', state.gender),
                          _buildTextField(context, '나이', state.age),
                          _buildTextField(context, '발달장애 진단명', state.diagnosis),
                          _buildTextField(
                              context, '현재 복용 중인 약물', state.medication),
                          _buildTextField(
                              context, '주로 발생하는 문제 행동', state.behavioralIssues),
                          _buildTextField(context, '행동 패턴 및 트리거 요인',
                              state.behaviorPatterns),
                          _buildTextField(
                              context, '일상 생활 패턴', state.dailyRoutine),
                        ],
                      ),
                    ),
                  ),
                ),
                if (state.errorMessage != null)
                  Text(
                    state.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                BigButton(
                  text: '저장하기',
                  onTap: () async {
                    // if (state.isAllFieldsFilled) {
                    // sendMessage
                    await viewModel.sendMessage(
                      '이름: ${state.name}, 성별: ${state.gender}, 나이: ${state.age}, 발달장애 진단명: ${state.diagnosis}, 현재 복용 중인 약물: ${state.medication}, 주로 발생하는 문제 행동: ${state.behavioralIssues}, 행동 패턴 및 트리거 요인: ${state.behaviorPatterns}, 일상 생활 패턴: ${state.dailyRoutine}',
                    );
                    context
                        .read<InformationViewModel>()
                        .saveUserInfo()
                        .then((_) {
                      context.go('/chat');
                    });
                    // }
                  },
                  // backgroundColor: state.isAllFieldsFilled && !state.isSaving
                  //     ? ColorStyles.primary100
                  //     : Colors.grey,
                  backgroundColor: ColorStyles.primary100,
                  textColor: ColorStyles.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String name, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        NameTextfield(
          name: name,
          hintText: '',
          onChanged: (newValue) =>
              context.read<InformationViewModel>().updateField(name, newValue),
          initialValue: value,
        ),
      ],
    );
  }
}
