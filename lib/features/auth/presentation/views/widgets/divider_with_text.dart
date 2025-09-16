import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0xff555555),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Text(
            text,
            style: AppTextStyles.styleRegular14(context),
          ),
        ),
         Expanded(
          child: Divider(
            thickness: 1,
             color: Color(0xff555555),
          ),
        ),
      ],
    );
  }
}
