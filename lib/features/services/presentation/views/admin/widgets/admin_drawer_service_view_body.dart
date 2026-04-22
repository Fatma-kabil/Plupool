import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/packages_tab_bar.dart';
import 'package:plupool/features/services/presentation/manager/cubits/booking_cubit.dart';
import 'package:plupool/features/services/presentation/manager/cubits/booking_state.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/booking_shimmer.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/customer_service_card.dart';

class AdminDrawerServiceViewBody extends StatefulWidget {
  const AdminDrawerServiceViewBody({super.key});

  @override
  State<AdminDrawerServiceViewBody> createState() =>
      _AdminDrawerServiceViewBodyState();
}

class _AdminDrawerServiceViewBodyState
    extends State<AdminDrawerServiceViewBody> {
  String selectedTab = "عاجلة";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        /// 🔄 Loading
        if (state is BookingLoading) {
          return BookingShimmer();
        }

        /// ❌ Error
        if (state is BookingError) {
          return Center(child: ErrorText(message: state.message));
        }

        /// ✅ Success
        if (state is BookingSuccess) {
          final allBookings = state.data.bookings;

          /// 🔥 Filter
          final filtered = allBookings.where((b) {
            if (selectedTab == "مكتملة") {
              return b.status == "completed";
            } else if (selectedTab == "مجدولة") {
              return b.status == "scheduled";
            } else {
              return b.status == "urgent";
            }
          }).toList();

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🧾 Title
                Text(
                  "إدارة الخدمات",
                  style: AppTextStyles.styleSemiBold18(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),

                SizedBox(height: SizeConfig.h(15)),

                /// 🔖 Tabs
                PackagesTabBar(
                  selectedTab: selectedTab,
                  onTabSelected: (tab) {
                    setState(() => selectedTab = tab);
                  },
                  counts: {
                    "عاجلة": state.data.statistics.urgent,
                    "مجدولة": state.data.statistics.scheduled,
                    "مكتملة": state.data.statistics.completed,
                  },
                ),

                SizedBox(height: SizeConfig.h(16)),
                filtered.isEmpty
                    ? Center(
                        child: ErrorText(
                          message: "📭 لا توجد طلبات في هذا القسم",
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: SizeConfig.h(15)),
                            child: CustomerServiceCard(
                              booking: filtered[index],
                            ),
                          );
                        },
                      ),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
