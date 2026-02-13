import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';

class EditRateCard extends StatelessWidget {
  const EditRateCard({super.key, required this.ratingController});

  final TextEditingController ratingController;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
          width: SizeConfig.isWideScreen
              ? SizeConfig.screenWidth * 0.80
              : double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(20),
          vertical: SizeConfig.h(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const FieldLabel("التقييم"),
            TextFieldWithIcon(
              hint: "ادخل تقييمك",
              icon: Icons.star_border,
              keyboardType: TextInputType.number,
              controller: ratingController,
            ),

            // ✅ هيشتغل
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextBtn(
                  text: "تعديل",
                  onPressed: () {},
                  padding: SizeConfig.isWideScreen ? 14 : 10,
                  width: SizeConfig.w(120),
                  textStyle: AppTextStyles.styleBold16(
                    context,
                  ).copyWith(color: Colors.white),
                  trailing: Icon(
                    Icons.edit_attributes_outlined,
                    color: Colors.white,
                    size: SizeConfig.w(15),
                  ),
                ),

                CustomOutlinedBtn(
                  text: 'إلغاء',
                                    padding: SizeConfig.isWideScreen ? 12 : 10,
                  trailing: Icon(
                    Icons.cancel_outlined,
                    color: AppColors.kprimarycolor,
                    size: SizeConfig.w(15),
                  ),
                  width: SizeConfig.w(120),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
