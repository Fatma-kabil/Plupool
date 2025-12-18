import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/parse_time_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/features/home/domain/entities/request_status.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/admin_packaes_card.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/filter_row.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/packages_tab_bar.dart';
import 'package:plupool/core/constants.dart';

class SeeAllPackagesViewBody extends StatefulWidget {
  const SeeAllPackagesViewBody({super.key});

  @override
  State<SeeAllPackagesViewBody> createState() => _SeeAllPackagesViewBodyState();
}

class _SeeAllPackagesViewBodyState extends State<SeeAllPackagesViewBody> {
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
                  : selectedTab == "مجدولة"
                  ? RequestStatus.scheduled
                  : RequestStatus.completed),
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

    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🧾 العنوان
          Text(
            "إدارة الباقات",
            style: AppTextStyles.styleSemiBold18(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
          SizedBox(height: SizeConfig.h(15)),
      
          // 🔖 التبويبات
          PackagesTabBar(
            selectedTab: selectedTab,
            onTabSelected: (tab) => setState(() => selectedTab = tab),
            counts: {
              "قيد التنفيذ": allRequests
                  .where((r) => r.status == RequestStatus.inProgress)
                  .length,
              "مجدولة": allRequests
                  .where((r) => r.status == RequestStatus.scheduled)
                  .length,
              "مكتمله": allRequests
                  .where((r) => r.status == RequestStatus.completed)
                  .length,
            },
          ),
      
          SizedBox(height: SizeConfig.h(16)),
      
          // 🧱 عرض الريكوستات المرتبة
          Column(
            children: [
              FilterRow(),
              SizedBox(height: SizeConfig.h(20),),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredRequests.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: SizeConfig.h(15)),
                    child: AdminPackaesCard(request: filteredRequests[index]),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
