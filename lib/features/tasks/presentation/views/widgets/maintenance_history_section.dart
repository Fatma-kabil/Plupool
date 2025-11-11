import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class MaintenanceHistorySection extends StatefulWidget {
  const MaintenanceHistorySection({super.key});

  @override
  State<MaintenanceHistorySection> createState() =>
      _MaintenanceHistorySectionState();
}

class _MaintenanceHistorySectionState extends State<MaintenanceHistorySection> {
  bool isExpanded = true; // الحالة المفتوحة أو المغلقة

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // العنوان والسهم
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "تاريخ الصيانة",
                    style: AppTextStyles.styleBold16(
                      context,
                    ).copyWith(color: AppColors.ktextcolor),
                  ),
                  SizedBox(width: SizeConfig.w(5)),
                  Icon(
                    Icons.access_time,
                    color: AppColors.kprimarycolor,
                    size: SizeConfig.w(17),
                  ),
                ],
              ),
              AnimatedRotation(
                turns: isExpanded ? 0 : 0.5, // يقلب السهم لأعلى أو لأسفل
                duration: const Duration(milliseconds: 200),
                child: const Icon(Icons.keyboard_arrow_up),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // المحتوى القابل للطي
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 250),
          crossFadeState: isExpanded
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: Column(
            children: const [
              MaintenanceCard(
                time: "6:26 PM",
                date: "8 أكتوبر 2025",
                chlorine: "2.5 ppm",
                ph: "7.2",
                temp: "25°C",
                note:
                    "جميع القراءات طبيعية. تم تنظيف سلال الكاشطة وغسل الفلتر.",
              ),
              MaintenanceCard(
                time: "11:00 AM",
                date: "20 أكتوبر 2025",
                chlorine: "1.8 ppm",
                ph: "7.9",
                temp: "26°C",
                note:
                    "تمت إضافة معالجة الكلور. فحص ضغط المضخة - تعمل بشكل طبيعي.",
              ),
            ],
          ),
          secondChild: const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class MaintenanceCard extends StatelessWidget {
  final String time;
  final String date;
  final String chlorine;
  final String ph;
  final String temp;
  final String note;

  const MaintenanceCard({
    super.key,
    required this.time,
    required this.date,
    required this.chlorine,
    required this.ph,
    required this.temp,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // التاريخ والوقت
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                time,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
              Text(
                date,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // القيم
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildItem("درجة الحرارة", temp, Icons.thermostat),
              _buildItem("مستوى الحموضة", ph, Icons.science),
              _buildItem("مستوى الكلور", chlorine, Icons.water_drop),
            ],
          ),
          const SizedBox(height: 10),

          // الملاحظات
          Text(
            note,
            style: const TextStyle(color: Color(0xff999999), fontSize: 13),
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 2),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(width: 4),
            Icon(icon, size: 16, color: Colors.blueAccent),
          ],
        ),
      ],
    );
  }
}
