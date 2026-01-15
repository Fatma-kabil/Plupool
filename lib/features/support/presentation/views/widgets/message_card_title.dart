import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/support/presentation/views/widgets/details_btn.dart';

class MessageCardTitle extends StatelessWidget {
  const MessageCardTitle({super.key, required this.role, required this.name, this.onTap});
  final String role;
  final String name;
  
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$role : $name',
          style: AppTextStyles.styleBold16(
            context,
          ).copyWith(color: Color(0xff555555)),
        ),
        Spacer(),
        DetailsBtn(onTap: onTap),
      ],
    );
  }
}
