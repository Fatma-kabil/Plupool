// 👇 محتوى تبويب "باقات الخدمات"
import 'package:flutter/widgets.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';

class ServicesPackagesSection extends StatelessWidget {
  const ServicesPackagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 25),
        Text(
          "باقات الخدمات",
          style: AppTextStyles.styleBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        SizedBox(height: 9),
        Text(
          " اختر خطة الصيانة المناسبة لاحتياجاتك",
          style: AppTextStyles.styleRegular16(
            context,
          ).copyWith(color: Color(0xff777777)),
          
        ),
          SizedBox(height: 40),
          CustomTextBtn(text: "حجز الباقه",width: double.infinity,onPressed: () {
            
          },)
      ],
    );
  }
}
