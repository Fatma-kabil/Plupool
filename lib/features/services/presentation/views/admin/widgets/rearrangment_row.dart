import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';

class RearragnmentRow extends StatelessWidget {
  const RearragnmentRow({
    super.key,
    required this.selected,
    required this.onChanged,
    this.onTap, this.items,
  });

  final String selected;
  final ValueChanged<String> onChanged;
  final void Function()? onTap;
  final List<String> ? items;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FilterOption(
          value: selected,
          items:items??  ["مكتمله", "مجدوله", "عاجله"],
          onChanged: (val) {
            if (val != null) {
              onChanged(val);
            }
          },
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(SizeConfig.w(6)),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff0077B6),
            ),
            child: Icon(Icons.add, color: Colors.white, size:SizeConfig.isWideScreen ? SizeConfig.w(15) : SizeConfig.w(18),),
          ),
        ),
      ],
    );
  }
}
