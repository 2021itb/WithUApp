import 'package:flutter/material.dart';
import 'package:with_u/data/model/message.dart';
import 'package:with_u/ui/color_styles.dart';

class QuestionContainer extends StatelessWidget {
  final Message message;

  const QuestionContainer({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          constraints: BoxConstraints(
            maxWidth:
                MediaQuery.of(context).size.width * 0.75, // 최대 너비를 200으로 설정
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorStyles.primary100),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message.message),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
