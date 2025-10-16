import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.h(5), right: SizeConfig.w(8)),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          message,
          style: AppTextStyles.styleRegular13(
            context,
          ).copyWith(color: Colors.red),
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
