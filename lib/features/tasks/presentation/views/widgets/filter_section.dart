import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class FilterSection extends StatefulWidget {
  final String title;
  final List<String> options;
  final Set<String> selectedSet;
  final VoidCallback? onCustomLocationRequested;

  const FilterSection({
    super.key,
    required this.title,
    required this.options,
    required this.selectedSet,
    this.onCustomLocationRequested,
  });

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppTextStyles.styleBold20(context)
              .copyWith(color: AppColors.ktextcolor),
        ),
        SizedBox(height: SizeConfig.h(10)),
        Wrap(
          spacing: SizeConfig.w(8),
          runSpacing: SizeConfig.h(8),
          children: widget.options.map((option) {
            final isSelected = widget.selectedSet.contains(option);

            return ChoiceChip(
              showCheckmark: false,
              label: Text(option),
              selected: isSelected,
              onSelected: (selected) async {
                if (option == "موقع مخصص" && selected) {
                  widget.onCustomLocationRequested?.call();
                } else {
                  setState(() {
                    if (selected) {
                      widget.selectedSet.add(option);
                    } else {
                      widget.selectedSet.remove(option);
                    }
                  });
                }
              },
              selectedColor: const Color(0xff55A4CE),
              backgroundColor: const Color(0x78D9D9D9),
              labelStyle: AppTextStyles.styleRegular13(context).copyWith(
                color: isSelected ? Colors.white : AppColors.ktextcolor,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
