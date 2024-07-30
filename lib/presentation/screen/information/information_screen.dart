import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:with_u/presentation/component/big_button.dart';
import 'package:with_u/presentation/component/name_textfield.dart';
import 'package:with_u/ui/text_styles.dart';
import 'package:with_u/ui/color_styles.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, TextEditingController> _controllers = {
    '이름': TextEditingController(),
    '성별': TextEditingController(),
    '나이': TextEditingController(),
    '발달장애 진단명': TextEditingController(),
    '현재 복용 중인 약물': TextEditingController(),
    '주로 발생하는 문제 행동': TextEditingController(),
    '행동 패턴 및 트리거 요인': TextEditingController(),
    '일상 생활 패턴': TextEditingController(),
  };

  bool get _isAllFieldsFilled =>
      _controllers.values.every((controller) => controller.text.isNotEmpty);

  @override
  void initState() {
    super.initState();
    _controllers.values.forEach((controller) {
      controller.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    _controllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Scrollable(
              viewportBuilder: (BuildContext context, ViewportOffset position) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '개인정보 입력',
                            style: TextStyles.headingH3,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '함께하기 위해 정보를 입력해주세요.',
                            style: TextStyles.bodyS,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: SingleChildScrollView(
                            child: Column(
                              children: _controllers.keys
                                  .map((name) => _buildTextField(name))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                      const BigButton(
                        text: '저장하기',
                        path: '',
                        backgroundColor: ColorStyles.primary100,
                        textColor: ColorStyles.white,
                      )
                    ]);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        NameTextfield(name: name, hintText: '')
      ],
    );
  }
}
