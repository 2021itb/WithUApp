import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:with_u/presentation/component/question_container.dart';
import 'package:with_u/presentation/component/response_container.dart';
import 'package:with_u/presentation/screen/chat/chat_view_model.dart';
import 'package:with_u/ui/text_styles.dart';

import '../../../ui/color_styles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 위젯이 빌드된 후 스크롤을 위로 이동
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToTop());
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    // if (_scrollController.hasClients) {
    //   _scrollController.jumpTo(
    //     _scrollController.position.minScrollExtent,
    //   );
    // }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollToTop();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChatViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'With U',
          style: TextStyles.headingH4,
        ),
      ),
      body: Column(
        children: [
          Consumer<ChatViewModel>(
            builder: (context, viewModel, child) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _scrollToTop();
              });

              return Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ListView.builder(
                    controller: _scrollController,
                    reverse: true,
                    itemCount: viewModel.messages.length,
                    itemBuilder: (context, index) {
                      final e = viewModel.messages[index];
                      if (e.role == 'user') {
                        return QuestionContainer(message: e);
                      } else {
                        return ResponseContainer(message: e);
                      }
                    },
                  ),
                ),
              );
            },
          ),
          BottomAppBar(
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
                    controller: _controller,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Image.asset('assets/send.png'),
                        ),
                        onTap: () {
                          viewModel.sendMessage(_controller.text);
                          _controller.clear();
                          FocusScope.of(context).unfocus();
                        },
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
        ],
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
