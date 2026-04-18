import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Text(
          message,
          style: AppTextStyles.styleSemiBold18(
            context,
          ).copyWith(color: Colors.black54),
        ),
      ),
    );
  }
}
