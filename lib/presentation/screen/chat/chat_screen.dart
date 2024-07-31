import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:with_u/presentation/screen/chat/chat_view_model.dart';
import 'package:with_u/ui/text_styles.dart';

import '../../../ui/color_styles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChatViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'With U',
          style: TextStyles.headingH4,
        ),
      ),
      body: SingleChildScrollView(
          child: Text(viewModel.messages.reversed.toString())),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          children: [
            IconButton(
              icon: Image.asset('assets/more_options.png'),
              onPressed: () {
                // 플러스 버튼 클릭 시 실행될 함수
              },
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Image.asset('assets/send.png'),
                    ),
                    onTap: () {},
                  ),
                  filled: true,
                  fillColor: ColorStyles.neutralLight,
                  border: InputBorder.none,
                  hintText: ' 위드유에게 이야기해 보세요',
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(71),
                    ),
                    borderSide: BorderSide(
                      color: ColorStyles.neutralLight,
                    ), // 기본 아웃라인 색상
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(71),
                    ),
                    borderSide: BorderSide(
                      color: ColorStyles.neutralLight,
                    ), // 기본 아웃라인 색상
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
