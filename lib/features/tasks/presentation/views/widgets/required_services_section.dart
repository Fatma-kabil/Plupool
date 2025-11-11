import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/service_tab_bar.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/service_card.dart';
import 'package:plupool/core/constants.dart'; // ✅ هنا هتجيب الليست من هنا مثلاً

class RequiredServicesSection extends StatefulWidget {
  const RequiredServicesSection({super.key});

  @override
  State<RequiredServicesSection> createState() =>
      _RequiredServicesSectionState();
}

class _RequiredServicesSectionState extends State<RequiredServicesSection> {
  String selectedTab = "قيد التنفيذ";

  @override
  Widget build(BuildContext context) {
    // ✅ هنا بنستخدم الليست اللي جاية من constants
    final List<ServiceRequest> allRequests = requests; // أو الاسم اللي عندك

    // فلترة الخدمات حسب التبويب الحالي
    final filteredRequests = allRequests
        .where((r) => r.status == selectedTab)
        .toList();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(SizeConfig.w(12)),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular(SizeConfig.w(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 🧾 العنوان
          Text(
            "الخدمات المطلوبة",
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
          SizedBox(height: SizeConfig.h(15)),

          // 🔖 التبويبات
          ServiceTabBar(
            selectedTab: selectedTab,
            onTabSelected: (tab) => setState(() => selectedTab = tab),
            counts: const {"قيد التنفيذ": 2, "مجدولة": 1},
          ),

          SizedBox(height: SizeConfig.h(16)),

          // 🧱 القائمة (بدون Expanded لتفادي الخطأ)
          SizedBox(
            height: SizeConfig.h(200),
            child: ListView.builder(
              itemCount: filteredRequests.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.h(12)),
                  child: ServiceCard(request: filteredRequests[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
