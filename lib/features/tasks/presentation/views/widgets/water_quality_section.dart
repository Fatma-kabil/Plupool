import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl; // ✅ حل التعارض باسم alias
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/data/models/water_quality_model.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/water_quality_card.dart';

class WaterQualitySection extends StatelessWidget {
  final WaterQualityModel data;

  const WaterQualitySection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // ✅ صيغة التاريخ بدون تعارض
    final formattedDate = intl.DateFormat('yyyy/MM/dd – hh:mm a')
        .format(data.lastUpdated)
        .replaceAll('AM', 'صباحا')
        .replaceAll('PM', 'مساء');

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(SizeConfig.w(12)),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular((SizeConfig.w(10))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          // 🧾 العنوان مع زر التحديث
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    "مقاييس جودة المياه",
                    style: AppTextStyles.styleBold16(
                      context,
                    ).copyWith(color: AppColors.ktextcolor),
                  ),
                  SizedBox(height: SizeConfig.h(4)),
                  Text(
                    "آخر تحديث: $formattedDate",
                    style: AppTextStyles.styleRegular14(
                      context,
                    ).copyWith(color: Color(0xff999999)),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // هنا تحطي اللي عايزة يحصل لما المستخدم يضغط
                  print("تضغطت على تحديث");
                },
                child: Text(
                  "تحديث",
                  style: AppTextStyles.styleBold16(context).copyWith(
                    color: AppColors.kprimarycolor,
                    decoration: TextDecoration.underline, // ✅ الخط تحت النص
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: SizeConfig.h(4)),

          // 🕒 التاريخ (محاط بـ Directionality لتفادي التعارض)
          SizedBox(height: SizeConfig.h(12)),

          // 🌊 بطاقات القياسات
          Column(
            children: [
              WaterQualityCard(
                title: "مستوى الكلور",
                value: "${data.chlorineLevel} ppm",
                idealRange: "1.0 - 3.0",
                icon: Icons.science_outlined,
                color: const Color(0xFF00B4D8),
                backgroundcolor: Color(0xffCCF0F7),
              ),
              SizedBox(height: SizeConfig.h(8)),
              WaterQualityCard(
                title: "مستوى الحموضة",
                value: "${data.phLevel}",
                idealRange: "7.2 - 7.6",
                icon: Icons.water_drop_outlined,
                color: const Color(0xFF0077B6),
                backgroundcolor: Color(0xffCCE4F0),
              ),
              SizedBox(height: SizeConfig.h(8)),
              WaterQualityCard(
                title: "درجة الحرارة",
                value: "${data.temperature}°c",
                //  idealRange: "25 - 30°م",
                icon: Icons.thermostat,
                color: const Color(0xFFFF9F1C),
                backgroundcolor: Color(0xffFFECD2),
              ),
            ],
          ),

          // 📝 الملاحظات (اختيارية)
          if (data.note != null && data.note!.isNotEmpty) ...[
            SizedBox(height: SizeConfig.h(16)),
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
                  Icon(
                    Icons.note_alt_outlined,
                    color: Color(0xff999999),
                    size: SizeConfig.w(24),
                  ),
                  SizedBox(width: SizeConfig.w(8)),
                  Expanded(
                    child: Text(
                      data.note!,
                      style: AppTextStyles.styleRegular13(
                        context,
                      ).copyWith(color: Color(0xff999999)),
                      textDirection: TextDirection.rtl,
                      softWrap: true, // ✅ يسمح للنص بالانتقال للسطر الجديد
                      overflow: TextOverflow.visible, //
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
