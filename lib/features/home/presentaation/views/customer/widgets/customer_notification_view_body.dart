import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/notification_card_shimmer.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/notification_card.dart';
import 'package:plupool/features/notifications/domain/entities/notification_entity.dart';
import 'package:plupool/features/notifications/presentation/manager/notification_cubit/notification_cubit.dart';
import 'package:plupool/features/notifications/presentation/manager/notification_cubit/notification_state.dart';

class CustomerNotificationViewBody extends StatefulWidget {
  const CustomerNotificationViewBody({super.key});

  @override
  State<CustomerNotificationViewBody> createState() =>
      _CustomerNotificationViewBodyState();
}

class _CustomerNotificationViewBodyState
    extends State<CustomerNotificationViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);

    context.read<NotificationCubit>().getNotifications();

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          selectedIndex = _tabController.index;
        });
      }
    });
  }

  List<NotificationEntity> _filterItems({
    required String tab,
    required List<NotificationEntity> notifications,
  }) {
    switch (tab) {
      case "التذكيرات":
        return notifications.where((e) => e.type == "visit_reminder").toList();

      case "العروض":
        return notifications.where((e) {
          return e.type == "product_offer" || e.type == "service_offer";
        }).toList();

      case "البلاغات":
        return notifications.where((e) {
          return e.type == "support_report" || e.type == "report";
        }).toList();

      case "الكل":
      default:
        return notifications;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabs = ["الكل", "التذكيرات", "العروض"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        SizedBox(height: SizeConfig.h(12)),

        /// ---------------------- Tabs ----------------------
        AnimatedBuilder(
          animation: _tabController.animation!,
          builder: (context, child) {
            final animationValue = _tabController.animation!.value;

            return SingleChildScrollView(
              reverse: true,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: tabs.asMap().entries.map((entry) {
                  final idx = entry.key;
                  final title = entry.value;

                  final selectedness =
                      1.0 - (animationValue - idx).abs().clamp(0.0, 1.0);

                  final backgroundColor = Color.lerp(
                    const Color(0xffF7F7F7),
                    AppColors.kprimarycolor,
                    selectedness,
                  )!;

                  final textColor = Color.lerp(
                    const Color(0xffBBBBBB),
                    Colors.white,
                    selectedness,
                  )!;

                  return GestureDetector(
                    onTap: () {
                      _tabController.animateTo(idx);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: SizeConfig.w(8)),
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.w(10),
                        vertical: SizeConfig.h(5),
                      ),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(SizeConfig.w(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.2),
                            blurRadius: 2,
                            offset: const Offset(1, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        title,
                        style: AppTextStyles.styleRegular16(
                          context,
                        ).copyWith(color: textColor, fontFamily: "Cairo"),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),

        /// ---------------------- List ----------------------
        Expanded(
          child: BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
              if (state is GetNotificationsLoading) {
                return ListView.builder(
                  padding: EdgeInsets.only(
                    top: SizeConfig.h(16),
                    left: SizeConfig.w(4),
                    right: SizeConfig.w(4),
                  ),
                  itemCount: 6,
                  itemBuilder: (_, __) => const NotificationCardShimmer(),
                );
              }
              if (state is GetNotificationsFailure) {
                return Center(child: ErrorText(message: state.message));
              }

              if (state is GetNotificationsSuccess) {
                final filtered = _filterItems(
                  tab: tabs[selectedIndex],
                  notifications: state.notifications,
                );

                if (filtered.isEmpty) {
                  return const Center(
                    child: ErrorText(message: "لا توجد إشعارات"),
                  );
                }

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
                      title: item.title,
                      subtitle: item.message,
                      time: item.createdAt.toString(),
                      type: item.type,
                      isRead: item.isRead,
                    );
                  },
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
