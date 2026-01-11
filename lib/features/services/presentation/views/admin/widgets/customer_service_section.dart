import 'package:flutter/widgets.dart';
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
    return Row(children: [
       FilterOption(
              value: selected,
              items: const ["مكتمله","قيد التنفيذ", "مجدوله", "عاجله"],
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    selected = val;
                  });
                }
              },
            ),
            Spacer(),
       
    ]);
  }
}
