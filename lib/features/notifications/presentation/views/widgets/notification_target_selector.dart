import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';

class NotificationTargetSelector extends StatefulWidget {
  final void Function(Set<String>) onChanged;

  const NotificationTargetSelector({
    super.key,
    required this.onChanged,
  });

  @override
  State<NotificationTargetSelector> createState() =>
      NotificationTargetSelectorState();
}

class NotificationTargetSelectorState
    extends State<NotificationTargetSelector> {
  final Set<String> _selected = {};

  bool _showError = false;

  final Map<String, String> _targets = const {
    "العملاء": "pool_owner",
    "الفنيين": "technician",
    "ممثلي الشركة": "company",
  };

  void _toggle(String label) {
    final role = _targets[label]!;

    setState(() {
      if (_selected.contains(role)) {
        _selected.remove(role);
      } else {
        _selected.add(role);
      }

      _showError = _selected.isEmpty;
    });

    widget.onChanged(_selected);
  }

  bool validate() {
    setState(() {
      _showError = _selected.isEmpty;
    });

    return _selected.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FieldLabel("إرسال إلى : "),

        Wrap(
          spacing: SizeConfig.w(20),
          children: _targets.entries.map((entry) {
            final label = entry.key;
            final role = entry.value;

            final isSelected = _selected.contains(role);

            return InkWell(
              onTap: () => _toggle(label),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: SizeConfig.w(0.82),
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: SizeConfig.isWideScreen
                            ? SizeConfig.w(4)
                            : 0,
                      ),
                      child: Checkbox(
                        value: isSelected,
                        onChanged: (_) => _toggle(label),
                        materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                        checkColor: AppColors.kprimarycolor,
                        activeColor: AppColors.kScaffoldColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: const BorderSide(
                            color: Color(0xff777777),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.isWideScreen
                        ? SizeConfig.w(10)
                        : 0,
                  ),
                  Text(
                    label,
                    style: AppTextStyles.styleRegular16(
                      context,
                    ).copyWith(
                      color: const Color(0xff777777),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),

        if (_showError)
          Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.h(6),
              right: SizeConfig.w(4),
            ),
            child: Text(
              "من فضلك اختر جهة واحدة على الأقل",
              style: AppTextStyles.styleRegular10(
                context,
              ).copyWith(
                color: Colors.red,
              ),
            ),
          ),
      ],
    );
  }
}