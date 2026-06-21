import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/admin_packaes_card.dart';
import 'package:plupool/features/packages/domain/entities/subscriber_entity.dart';
import 'package:plupool/features/packages/presentation/manager/package_cubit/package_cubit.dart';
import 'package:plupool/features/packages/presentation/manager/package_cubit/package_state.dart';
import 'package:plupool/features/packages/presentation/views/widgets/packages_shimmer_list.dart';

class AdminHomeViewBodyFooter extends StatelessWidget {
  const AdminHomeViewBodyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'الباقات الجارية',
              style: AppTextStyles.styleSemiBold18(context),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => context.push('/seeallpackagesview'),
              child: Text(
                'عرض الكل',
                style: AppTextStyles.styleSemiBold18(context).copyWith(
                  color: AppColors.kprimarycolor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.kprimarycolor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: SizeConfig.h(15)),
        BlocBuilder<PackagesCubit, PackagesState>(
          builder: (context, state) {
            /// 🔄 Loading
            if (state is PackagesLoading) {
              return const PackagesShimmerList();
            }

            /// ❌ Error
            if (state is PackagesError) {
              return Center(child: ErrorText(message: state.message));
            }

            /// ✅ Success
            /// ✅ Success
            if (state is PackagesSuccess) {
              final packages = state.response.packages;

              final filtered = packages
                  .where((e) => e.status == "in_progress")
                  .toList();

              final subscribersData = filtered.expand((package) {
                return package.subscribers.map(
                  (subscriber) => {
                    "subscriber": subscriber,
                    "packageName": package.nameAr,
                    "visitsCount": package.visitsCount,
                    "status": package.status,
                    "packageId":package.id
                  },
                );
              }).toList();

              /// بداية بكرة الساعة 00:00
              final now = DateTime.now();
              final tomorrow = DateTime(
                now.year,
                now.month,
                now.day,
              ).add(const Duration(days: 1));

              /// الاحتفاظ فقط بالزيارات من بكرة وما بعدها
              final upcomingSubscribers = subscribersData.where((item) {
                final subscriber = item["subscriber"] as SubscriberEntity;

                if (subscriber.nextVisitDate?.isEmpty ?? true) {
                  // التاريخ فاضي أو null

                  return false;
                }

                final nextVisit = DateTime.tryParse(
                  "${subscriber.nextVisitDate} ${subscriber.nextVisitTime ?? "00:00:00"}",
                );

                if (nextVisit == null) {
                  return false;
                }

                return !nextVisit.isBefore(tomorrow);
              }).toList();

              /// ترتيبهم حسب أقرب زيارة
              upcomingSubscribers.sort((a, b) {
                final subscriberA = a["subscriber"] as SubscriberEntity;
                final subscriberB = b["subscriber"] as SubscriberEntity;

                final dateA = DateTime.parse(
                  "${subscriberA.nextVisitDate} ${subscriberA.nextVisitTime ?? "00:00:00"}",
                );

                final dateB = DateTime.parse(
                  "${subscriberB.nextVisitDate} ${subscriberB.nextVisitTime ?? "00:00:00"}",
                );

                return dateA.compareTo(dateB);
              });

              if (upcomingSubscribers.isEmpty) {
                return const Center(
                  child: ErrorText(message: "لا توجد باقات جارية"),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: upcomingSubscribers.length,
                itemBuilder: (context, index) {
                  final item = upcomingSubscribers[index];

                  return AdminPackaesCard(
                    request: item["subscriber"] as SubscriberEntity,
                    packageName: item["packageName"] as String,
                    status: item["status"] as String,
                    packageId: item["packageId"] as int,
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
