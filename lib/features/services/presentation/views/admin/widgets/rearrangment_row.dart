import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';

class RearragnmentRow extends StatefulWidget {
  const RearragnmentRow({super.key});

  @override
  State<RearragnmentRow> createState() => _RearragnmentRowState();
}

String selected = "الكل";

class _RearragnmentRowState extends State<RearragnmentRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FilterOption(
          value: selected,
          items: const ["مكتمله", "قيد التنفيذ", "مجدوله", "عاجله", "الكل"],
          onChanged: (val) {
            if (val != null) {
              setState(() {
                selected = val;
              });
            }
          },
        ),
        Spacer(),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.all(SizeConfig.w(6)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff0077B6), // بيتغير مع selected/unselected
            ),
            child: Icon(Icons.add, color: Colors.white, size: SizeConfig.w(18)),
          ),
        ),
      ],
    );
  }
}
