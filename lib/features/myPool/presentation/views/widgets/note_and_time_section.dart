import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class NoteAndTimeSection extends StatelessWidget {
  const NoteAndTimeSection({super.key,  this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(SizeConfig.w(12)),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff777777)),
        borderRadius: BorderRadius.circular(SizeConfig.w(10)),
      ),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textDirection: TextDirection.rtl,
                "الخميس:  8 أكتوبر 2025 ",
                style: AppTextStyles.styleRegular14(
                  context,
                ).copyWith(color: const Color(0xff777777)),
              ),
              Text(
                textDirection: TextDirection.rtl,
                "6:26 PM",
                style: AppTextStyles.styleRegular14(
                  context,
                ).copyWith(color: const Color(0xff777777)),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(10)),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Icon(
                Icons.notes,
                color: Color(0xff999999),
                size: SizeConfig.w(20),
              ),

              SizedBox(width: SizeConfig.w(6)),
              Expanded(
                child: Text(
                text??  "ضغط الفلتر ضعيف، في تسريب بسيط، محتاج تنظيف كامل",
                  style: AppTextStyles.styleRegular14(
                    context,
                  ).copyWith(color: Color(0xff777777)),
                  textDirection: TextDirection.rtl,
                  softWrap: true, // ✅ يسمح للنص بالانتقال للسطر الجديد
                  overflow: TextOverflow.visible, //
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
