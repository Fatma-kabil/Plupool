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
    final type = notificationFilters[selectedKey]!["type"];

    if (type == null) return adminNotification;

    return adminNotification.where((item) => item["type"] == type).toList();
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
                  setState(() => selectedKey = val);
                }
              },
            ),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: SizeConfig.h(20))),

        /// -------- Empty State --------
        if (filteredList.isEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(4)),
              child: Text(
                "لا توجد اشعارات",
                style: AppTextStyles.styleRegular16(context),
              ),
            ),
          )
        else
          /// -------- List --------
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final item = filteredList[index];

              return NotificationCard(
                title: item["title"],
                subtitle: item["subtitle"],
                time: item["time"],
                type: item["type"],
              );
            }, childCount: filteredList.length),
          ),
      ],
    );
  }
}
