import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class NoteSection extends StatelessWidget {
  const NoteSection({super.key, required this.note});
  final String note;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          textDirection: TextDirection.rtl,
          "الملاحظات",
          style: AppTextStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        SizedBox(height: SizeConfig.h(6)),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(SizeConfig.w(12)),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.ktextcolor),
            borderRadius: BorderRadius.circular(SizeConfig.w(10)),
          ),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              SvgPicture.asset(
                'assets/icons/notes.svg',
                color: Color(0xff999999),
                width: SizeConfig.w(24),
                height: SizeConfig.w(24),
              ),

              SizedBox(width: SizeConfig.w(3)),
              Expanded(
                child: Text(
                  note,
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: Color(0xff777777)),
                  textDirection: TextDirection.rtl,
                  softWrap: true, // ✅ يسمح للنص بالانتقال للسطر الجديد
                  overflow: TextOverflow.visible, //
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
