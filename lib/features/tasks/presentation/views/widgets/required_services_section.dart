import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/features/home/domain/entities/request_status.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/service_tab_bar.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/service_card.dart';
import 'package:plupool/core/constants.dart'; // ✅ جايه من هنا

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
    final List<ServiceRequest> allRequests = requests;

    // ✅ فلترة الريكوستات حسب التبويب المختار باستخدام enum
    final filteredRequests = allRequests
        .where(
          (r) =>
              r.status ==
              (selectedTab == "قيد التنفيذ"
                  ? RequestStatus.inProgress
                  : RequestStatus.scheduled),
        )
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
         mainAxisSize: MainAxisSize.min, // مهم عشان Column ما يحاولش ياخد كل الارتفاع
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
            counts: {
              "قيد التنفيذ": allRequests
                  .where((r) => r.status == RequestStatus.inProgress)
                  .length,
              "مجدولة": allRequests
                  .where((r) => r.status == RequestStatus.scheduled)
                  .length,
            },
          ),

          SizedBox(height: SizeConfig.h(16)),

          // 🧱 عرض الريكوستات بناءً على التاب الحالي
         ListView.builder(
            shrinkWrap: true,
         physics: NeverScrollableScrollPhysics(), 
           itemCount: filteredRequests.length,
           itemBuilder: (context, index) {
             return Padding(
               padding: EdgeInsets.only(bottom: SizeConfig.h(12)),
               child: ServiceCard(request: filteredRequests[index]),
             );
           },
         ),

        ],
      ),
    );
  }
}
