import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/packages_tab_bar.dart';
import 'package:plupool/features/services/data/models/customer_service_card_model.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/customer_service_card.dart';

class AdminDrawerServiceViewBody extends StatefulWidget {
  const AdminDrawerServiceViewBody({super.key});

  @override
  State<AdminDrawerServiceViewBody> createState() => _AdminDrawerServiceViewBodyState();
}

class _AdminDrawerServiceViewBodyState extends State<AdminDrawerServiceViewBody> {
  String selectedTab ="عاجلة" ;

  @override
  Widget build(BuildContext context) {
    // ✅ نبدأ من القائمة الأصلية
    final List<CustomerServiceCardModel> allRequests = customerServices;

    // ✅ فلترة حسب التبويب
    final filteredRequests = allRequests
        .where(
          (r) =>
              r.statu ==
              (selectedTab == "مكتملة"
                  ? RequestStatus.completed
                  : selectedTab == "مجدولة"
                  ? RequestStatus.scheduled
                  : RequestStatus.urgent),
        )
        .toList();

    // ✅ ترتيب حسب التاريخ والوقت (الأقدم أولًا)
 //   filteredRequests.sort((a, b) {
   //   final dateA = DateTime.parse(a.date);
    //  final dateB = DateTime.parse(b.date);

      // لو التاريخين متساويين، نرتب حسب الوقت
    //  if (dateA == dateB) {
      //  final timeA = parseTime(a.time);
       // final timeB = parseTime(b.time);
     //   return timeA.compareTo(timeB);
   //   }

      // غير كده نرتب حسب التاريخ
  //    return dateA.compareTo(dateB);
//    });

    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🧾 العنوان
          Text(
            "إدارة الخدمات",
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
               "عاجله": allRequests
                  .where((r) => r.statu == RequestStatus.urgent)
                  .length,
                   "مجدولة": allRequests
                  .where((r) => r.statu == RequestStatus.scheduled)
                  .length,
              "مكتملة": allRequests
                  .where((r) => r.statu == RequestStatus.completed)
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
                padding: EdgeInsets.only(bottom: SizeConfig.h(15)),
                child: CustomerServiceCard(request: filteredRequests[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}
