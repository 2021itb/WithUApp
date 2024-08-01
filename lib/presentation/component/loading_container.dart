import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:with_u/ui/color_styles.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorStyles.neutralLight),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Lottie.asset('assets/loading_bar.json', height: 50),
          ),
        ),
      ),
    );
  }
}
