import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => FilterDialogState();
}

class FilterDialogState extends State<FilterDialog> {
  final Map<String, bool> options = {
    "الكترونيات": false,
    "أثاث": false,
    "ملابس": false,
    "ألعاب": false,
  };

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.all(SizeConfig.w(16)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.w(17),
          right: SizeConfig.w(17),
          top: SizeConfig.h(34),
          bottom: SizeConfig.h(55),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// شبكة الاختيارات
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              physics: const NeverScrollableScrollPhysics(),
              children: options.keys.map((key) {
                return Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Checkbox(
                      value: options[key],
                      activeColor: AppColors.kprimarycolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      side: const BorderSide(
                        color: Color(0xffAAAAAA),
                        width: 2,
                      ),
                      onChanged: (val) {
                        setState(() {
                          options[key] = val ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        key,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: AppTextStyles.styleSemiBold16(context)
                            .copyWith(color: AppColors.ktextcolor),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),

            const SizedBox(height: 50),

            /// الأزرار تحت
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOutlinedBtn(
                  text: "إلغاء",
                 
                ),
                ElevatedButton(
                  onPressed: () {
                    final selectedCategory = options.entries
                        .firstWhere(
                          (e) => e.value,
                          orElse: () => MapEntry("", false),
                        )
                        .key;

                    Navigator.pop(
                      context,
                      selectedCategory.isNotEmpty
                          ? options.keys.toList().indexOf(selectedCategory)
                          : null, // null → الكل
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kprimarycolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.isWideScreen ? SizeConfig.h(7) : 0),
                    child: Text(
                      "تصفية",
                      style: AppTextStyles.styleBold16(context)
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}