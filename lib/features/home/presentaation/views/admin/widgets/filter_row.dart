import 'package:flutter/material.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';

class FilterRow extends StatefulWidget {
  const FilterRow({super.key});

  @override
  State<FilterRow> createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  String selected = "باقة شهرية";

  @override
  Widget build(BuildContext context) {
    return
    /// Dropdown للأجدد
    FilterOption(
      value: selected,
      items: const ["باقة شهرية", "باقة 4 شهور", "باقة سنوية"],
      onChanged: (val) {
        if (val != null) {
          setState(() {
            selected = val;
          });
        }
      },
    );

    /// عدد التعليقات
  }
}
