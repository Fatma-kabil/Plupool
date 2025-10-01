import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

List<TextSpan> highlightWord(BuildContext context, String text, String targetWord) {
  final baseStyle = AppTextStyles.styleRegular16(context)
      .copyWith(color: const Color(0xff777777));

  final highlightStyle = baseStyle.copyWith(
    color: AppColors.kprimarycolor,
    fontWeight: FontWeight.bold,
  );

  final spans = <TextSpan>[];
  final regex = RegExp(RegExp.escape(targetWord));

  text.splitMapJoin(
    regex,
    onMatch: (m) {
      spans.add(TextSpan(text: m[0], style: highlightStyle));
      return '';
    },
    onNonMatch: (n) {
      spans.add(TextSpan(text: n, style: baseStyle));
      return '';
    },
  );

  return spans;
}
