import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/notification_card.dart';

class NotificationsViewBody extends StatefulWidget {
  const NotificationsViewBody({super.key});

  @override
  State<NotificationsViewBody> createState() => _NotificationsViewBodyState();
}

class _NotificationsViewBodyState extends State<NotificationsViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> allItems = [
    {
      "type": "reminder",
      "title": "موعد زيارة العميل غدًا الساعة 9:00 صباحًا",
      "subtitle": "مدينة نصر، فيلا 5",
      "time": "منذ ساعتين",
    },
    {
      "type": "offer",
      "title": "عرض خاص",
      "subtitle": "احصل على خصم 20% عند شراء قطع الغيار",
      "time": "منذ يوم",
    },
    {
      "type": "offer",
      "title": "عرض خاص",
      "subtitle": "احصل على خصم 20% عند شراء قطع الغيار",
      "time": "منذ يومين",
    },
    {
      "type": "reminder",
      "title": "موعد الصيانة الأسبوعية",
      "subtitle": "فرع الشيخ زايد",
      "time": "منذ ٣ ساعات",
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this ,initialIndex: 2);
  }

  List<Map<String, dynamic>> _filterItems(String tab) {
    if (tab == "الكل") return allItems;
    if (tab == "العروض") {
      return allItems.where((i) => i["type"] == "offer").toList();
    }
    if (tab == "التذكيرات") {
      return allItems.where((i) => i["type"] == "reminder").toList();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final tabs = ["العروض", "التذكيرات", "الكل"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        SizedBox( height:  SizeConfig.h(12)),
        AnimatedBuilder(
          animation: _tabController.animation!,
          builder: (context, child) {
            final animationValue = _tabController.animation!.value;

            return Align(
              alignment: Alignment.centerRight,
              child: TabBar(
                controller: _tabController,
                   isScrollable: true,
                indicator: BoxDecoration(),
                dividerColor: Colors.transparent,
                labelPadding: EdgeInsets.only(left: SizeConfig.w(15),right: SizeConfig.w(10) ), // أقل قيمة ممكنة
                tabs: tabs.asMap().entries.map((entry) {
                  int idx = entry.key;
                  String t = entry.value;

                  // حساب نسبة اختيار التاب بناءً على قيمة الأنيميشن
                  double selectedness =
                      1.0 - (animationValue - idx).abs().clamp(0.0, 1.0);

                  // لون الخلفية يتدرج بين اللون غير المحدد ولون التحديد
                  Color backgroundColor = Color.lerp(
                    const Color(0xFFF7F7F7),
                    AppColors.kprimarycolor,
                    selectedness,
                  )!;

                  // لون النص يتدرج بنفس الطريقة
                  Color textColor = Color.lerp(
                    const Color(0xffBBBBBB),
                    Colors.white,
                    selectedness,
                  )!;

                  return Tab(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.w(14),
                        vertical: SizeConfig.h(8),
                      ),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(SizeConfig.w(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(1, 2),
                            blurRadius: 1,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Text(
                        t,
                        style: AppTextStyles.styleRegular16(
                          context,
                        ).copyWith(fontFamily: 'cairo', color: textColor),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),

        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: tabs.map((tab) {
              final filtered = _filterItems(tab);

              return ListView.builder(
                padding: EdgeInsets.only(
                  top: SizeConfig.h(16),
                  left: SizeConfig.w(4),
                  right: SizeConfig.w(4),
                ),
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final item = filtered[index];
                  return NotificationCard(
                    title: item["title"],
                    subtitle: item["subtitle"],
                    time: item["time"],
                    type: item["type"],
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
