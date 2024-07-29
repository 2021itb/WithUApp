import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:with_u/ui/text_styles.dart';

class BigButton extends StatelessWidget {
  final String text;
  final String path;
  final Color backgroundColor;
  final Color textColor;

  const BigButton({
    super.key,
    required this.text,
    required this.path,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 10,
          bottom: 10,
        ),
        child: GestureDetector(
          onTap: () {
            context.go(path);
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: backgroundColor),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  text,
                  style: TextStyles.actionM.copyWith(color: textColor),
                ),
              ),
            ),
          ),
        ));
  }
}
