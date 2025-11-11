import 'package:flutter/material.dart';

class ServiceTabBar extends StatelessWidget {
  final String selectedTab;
  final Function(String) onTabSelected;
  final Map<String, int> counts;

  const ServiceTabBar({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
    required this.counts,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: counts.keys.map((tab) {
        final isSelected = selectedTab == tab;
        return Padding(
          padding: const EdgeInsets.only(left: 8),
          child: GestureDetector(
            onTap: () => onTabSelected(tab),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF2196F3) : Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "$tab (${counts[tab]})",
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey[800],
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
