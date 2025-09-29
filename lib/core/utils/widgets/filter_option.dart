import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class FilterOption extends StatelessWidget {
  final String value; // القيمة المختارة حاليًا
  final IconData icon;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const FilterOption({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
    this.icon = Icons.arrow_drop_down,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Dropdown جوه Container بحدود
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff999999)),
            borderRadius: BorderRadius.circular(10),
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                value: value,
                isDense: true,

                /// عناصر القائمة
                items: items
                    .map(
                      (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Align(
                          alignment: Alignment
                              .centerRight, // 👈 يخلي النص يبدأ من اليمين
                          child: Text(
                            e,
                            style: AppTextStyles.styleRegular16(
                              context,
                            ).copyWith(color: AppColors.kprimarycolor),
                          ),
                        ),
                      ),
                    )
                    .toList(),

                onChanged: onChanged,
                menuItemStyleData: const MenuItemStyleData(
                  height: 30, // 👈 المسافة بين كل عنصر والتاني
                  // padding: EdgeInsets.symmetric(horizontal: 8),
                ),

                /// شكل الزر نفسه
                buttonStyleData: const ButtonStyleData(
                  //   height: 40,
                  padding: EdgeInsets.zero,
                ),

                /// شكل القائمة
                dropdownStyleData: DropdownStyleData(
                  //  maxHeight: 200,
                  width: 115,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  direction: DropdownDirection.right,
                  offset: const Offset(0, -10),
                ),

                /// نخفي الأيقونة الافتراضية
                iconStyleData: const IconStyleData(icon: SizedBox.shrink()),

                /// العنصر المعروض (النص وبعده الأيقونة)
                customButton: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon,
                      color: const Color(0xff999999),
                      size: SizeConfig.w(20),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      value,
                      style: AppTextStyles.styleRegular16(
                        context,
                      ).copyWith(color: const Color(0xff999999)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 5),

        /// النص "الترتيب حسب"
        Text(
          "الترتيب حسب: ",
          textDirection: TextDirection.rtl,
          style: AppTextStyles.styleRegular16(
            context,
          ).copyWith(color: const Color(0xff777777)),
        ),
      ],
    );
  }
}
