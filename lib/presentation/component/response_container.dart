import 'package:flutter/material.dart';
import 'package:with_u/ui/color_styles.dart';

class ResponseContainer extends StatelessWidget {
  final String message;

  const ResponseContainer({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.65, // 최대 너비를 200으로 설정
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorStyles.neutralLight),
        child: Text(message),
      ),
    );
  }
}
