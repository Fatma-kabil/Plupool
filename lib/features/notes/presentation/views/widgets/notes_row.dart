import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class NotesRow extends StatelessWidget {
  const NotesRow({super.key, required this.note});
  final String note;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.notes,
          size: SizeConfig.w(SizeConfig.isWideScreen ? 15 : 20),
          color: Color(0xffBBBBBB),
        ),
        SizedBox(width: SizeConfig.w(8)),
        Expanded(
          child: Text(
           note,
            style: AppTextStyles.styleRegular14(
              context,
            ).copyWith(color: Color(0xff777777)),
          ),
        ),
      ],
    );
  }
}
