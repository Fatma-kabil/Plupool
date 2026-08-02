import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/notification_card_shimmer.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/notification_card.dart';
import 'package:plupool/features/notifications/domain/entities/notification_entity.dart';
import 'package:plupool/features/notifications/presentation/manager/notification_cubit/notification_cubit.dart';
import 'package:plupool/features/notifications/presentation/manager/notification_cubit/notification_state.dart';

class NotificationInboxSection extends StatefulWidget {
  const NotificationInboxSection({super.key});

  @override
  State<NotificationInboxSection> createState() =>
      _NotificationInboxSectionState();
}

class _NotificationInboxSectionState extends State<NotificationInboxSection> {
  String selectedKey = "all";

  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().getNotifications();
  }
List<NotificationEntity> _filteredList(
  List<NotificationEntity> notifications,
) {
  switch (selectedKey) {
    case "requests":
      return notifications.where((item) {
        return item.type == "maintenance_request" ||
            item.type == "construction_request" ||
            item.type == "store_order";
      }).toList();

    case "offers":
      return notifications.where((item) {
        return item.type == "product_offer" ||
            item.type == "service_offer";
      }).toList();

    case "inventory":
      return notifications.where((item) {
        return item.type == "low_stock" ||
            item.type == "out_of_stock";
      }).toList();

    case "reports":
      return notifications.where((item) {
        return item.type == "support_report";
      }).toList();

    case "ratings":
      return notifications.where((item) {
        return item.type == "service_rating";
      }).toList();

    case "reminders":
      return notifications.where((item) {
        return item.type == "visit_reminder";
      }).toList();

    case "general":
      return notifications.where((item) {
        return item.type == "general";
      }).toList();

    case "all":
    default:
      return notifications;
  }
}

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /// ---------------- Filter ----------------
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(4)),
            child: FilterOption(
              value: selectedKey,
              items: notificationFilters.keys.toList(),
              displayText: (key) => notificationFilters[key]!["label"]!,
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    selectedKey = val;
                  });
                }
              },
            ),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: SizeConfig.h(20))),

        BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state is GetNotificationsLoading) {
              return SliverPadding(
                padding: EdgeInsets.only(
                  top: SizeConfig.h(20),
                  left: SizeConfig.w(4),
                  right: SizeConfig.w(4),
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, __) => const NotificationCardShimmer(),
                    childCount: 4,
                  ),
                ),
              );
            }

            if (state is GetNotificationsFailure) {
              return SliverFillRemaining(
                child: Center(child: ErrorText(message: state.message)),
              );
            }

            if (state is GetNotificationsSuccess) {
              final notifications = _filteredList(state.notifications);

              if (notifications.isEmpty) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text(
                      "لا توجد إشعارات",
                      style: AppTextStyles.styleRegular16(context),
                    ),
                  ),
                );
              }

              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = notifications[index];

                  return NotificationCard(
                    title: item.title,
                    subtitle: item.message,
                    time: item.createdAt.toString(),
                    type: item.type,
                    isRead: item.isRead,

                    onTap: () async {
                      if (!item.isRead) {
                        await context
                            .read<NotificationCubit>()
                            .markNotificationAsRead(item.id);

                     
                      }

                    },
                  );
                }, childCount: notifications.length),
              );
            }

            return const SliverFillRemaining(child: SizedBox());
          },
        ),
      ],
    );
  }
}
