import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/parse_time_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/features/home/domain/entities/request_status.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/service_tab_bar.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/service_card.dart';
import 'package:plupool/core/constants.dart';

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
    // ✅ نبدأ من القائمة الأصلية
    final List<ServiceRequest> allRequests = requests;

    // ✅ فلترة حسب التبويب
    final filteredRequests = allRequests
        .where(
          (r) =>
              r.status ==
              (selectedTab == "قيد التنفيذ"
                  ? RequestStatus.inProgress
                  : RequestStatus.scheduled),
        )
        .toList();

    // ✅ ترتيب حسب التاريخ والوقت (الأقدم أولًا)
    filteredRequests.sort((a, b) {
      final dateA = DateTime.parse(a.date);
      final dateB = DateTime.parse(b.date);

      // لو التاريخين متساويين، نرتب حسب الوقت
      if (dateA == dateB) {
        final timeA = parseTime(a.time);
        final timeB = parseTime(b.time);
        return timeA.compareTo(timeB);
      }

      // غير كده نرتب حسب التاريخ
      return dateA.compareTo(dateB);
    });

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(SizeConfig.w(12)),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular(SizeConfig.w(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
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

          // 🧱 عرض الريكوستات المرتبة
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
