import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

class FilterOption extends StatelessWidget {
  final String value; // القيمة المختارة حاليًا
  final IconData icon;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const FilterOption({
    super.key,
    required this.items,
    required this.onChanged,

    this.icon = Icons.arrow_drop_down,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff999999)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isDense: true,
                borderRadius: BorderRadius.circular(8),
                dropdownColor: Colors.white,
                value: value,
                icon: const SizedBox.shrink(), // نخفي الأيقونة الافتراضية
                items: items
                    .map(
                      (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(
                          e,
                          style: AppTextStyles.styleRegular16(
                            context,
                          ).copyWith(color: AppColors.kprimarycolor),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: onChanged,

                // 👇 هنا نتحكم في الشكل اللي ظاهر فوق بس
                selectedItemBuilder: (context) {
                  return items.map((e) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(icon, color: const Color(0xff999999)),
                        Text(
                          e,
                          style: AppTextStyles.styleRegular16(
                            context,
                          ).copyWith(color: const Color(0xff999999)),
                        ),
                        const SizedBox(width: 2),
                      ],
                    );
                  }).toList();
                },
              ),
            ),
          ),
        ),

        SizedBox(width: 5),

        /// الترتيب حسب:
        Text(
          textDirection: TextDirection.rtl,
          "الترتيب حسب: ",
          style: AppTextStyles.styleRegular16(
            context,
          ).copyWith(color: Color(0xff777777)),
        ),
      ],
    );
  }
}
