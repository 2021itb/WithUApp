import 'package:flutter/material.dart';
import 'package:with_u/presentation/component/big_button.dart';
import 'package:with_u/ui/color_styles.dart';
import 'package:with_u/ui/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.primary100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'always',
                  style: TextStyles.headingH2
                      .copyWith(color: ColorStyles.lightest),
                ),
                Text(
                  'With U!',
                  style: TextStyles.headingH1.copyWith(color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            const BigButton(
                text: '시작하기',
                path: '/information',
                backgroundColor: ColorStyles.lightest,
                textColor: ColorStyles.primary100)
          ],
        ),
      ),
    );
  }
}