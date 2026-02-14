import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/message_status_text.dart';
import 'package:plupool/core/utils/functions/parse_time_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/packages_tab_bar.dart';
import 'package:plupool/features/reports/data/models/report_model.dart';
import 'package:plupool/features/reports/presentation/views/widgets/admin_drawer_report_card.dart';

class AdminDrawerReportViewBody extends StatefulWidget {
  const AdminDrawerReportViewBody({super.key});

  @override
  State<AdminDrawerReportViewBody> createState() =>
      _AdminDrawerReportViewBodyState();
}

class _AdminDrawerReportViewBodyState extends State<AdminDrawerReportViewBody> {
  String selectedTab = "جديد";

  @override
  Widget build(BuildContext context) {
    // ✅ نبدأ من القائمة الأصلية
    final List<ReportModel> allRequests = reports;

    // ✅ فلترة حسب التبويب
    final filteredRequests = allRequests
        .where(
          (r) =>
              r.status ==
              (selectedTab == "قيد المراجعة"
                  ? MessageStatus.pending
                  : selectedTab == "تم الحل"
                  ? MessageStatus.solved
                  : MessageStatus.newer),
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
          // 🔖 التبويبات
          PackagesTabBar(
            borderRaduis: SizeConfig.w(10),
            selectedTab: selectedTab,
            onTabSelected: (tab) => setState(() => selectedTab = tab),
            counts: {
              "جديد": allRequests
                  .where((r) => r.status == MessageStatus.newer)
                  .length,
              "قيد المراجعة": allRequests
                  .where((r) => r.status == MessageStatus.pending)
                  .length,
              "تم الحل": allRequests
                  .where((r) => r.status == MessageStatus.solved)
                  .length,
            },
          ),

          SizedBox(height: SizeConfig.h(16)),

          // 🧱 عرض الريكوستات المرتبة
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ابحث عن العميل:",
                style: AppTextStyles.styleSemiBold16(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.w(4),
                  vertical: SizeConfig.h(20),
                ),
                child: CustomSearchPerson(
                  hintText: "ابحث بأسم العميل او رقم الهاتف",
                ),
              ),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredRequests.length,
                itemBuilder: (context, index) {
                  return AdminDrawerReportCard(model: filteredRequests[index]);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
