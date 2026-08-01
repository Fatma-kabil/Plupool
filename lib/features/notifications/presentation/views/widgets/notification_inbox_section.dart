import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/notification_card.dart';

class NotificationInboxSection extends StatefulWidget {
  const NotificationInboxSection({super.key});

  @override
  State<NotificationInboxSection> createState() =>
      _NotificationInboxSectionState();
}

class _NotificationInboxSectionState extends State<NotificationInboxSection> {
  String selectedKey = "all";

  List<Map<String, dynamic>> get filteredList {
    switch (selectedKey) {
      case "offers":
        return adminNotification.where((item) {
          return item["type"] == "product_offer" ||
              item["type"] == "service_offer";
        }).toList();

      case "reports":
        return adminNotification.where((item) {
          return item["type"] == "report" ||
              item["type"] == "support_report";
        }).toList();

      case "reminders":
        return adminNotification.where((item) {
          return item["type"] == "visit_reminder";
        }).toList();

      case "general":
        return adminNotification.where((item) {
          return item["type"] == "general";
        }).toList();

      case "all":
      default:
        return adminNotification;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /// -------- Filter --------
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

        SliverToBoxAdapter(
          child: SizedBox(height: SizeConfig.h(20)),
        ),

        /// -------- Empty State --------
        if (filteredList.isEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(4)),
              child: Center(
                child: Text(
                  "لا توجد إشعارات",
                  style: AppTextStyles.styleRegular16(context),
                ),
              ),
            ),
          )
        else

          /// -------- List --------
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = filteredList[index];

                return NotificationCard(
                  title: item["title"],
                  subtitle: item["subtitle"],
                  time: item["time"],
                  type: item["type"],
                  isRead: item["isRead"] ?? false,
                );
              },
              childCount: filteredList.length,
            ),
          ),
      ],
    );
  }
}