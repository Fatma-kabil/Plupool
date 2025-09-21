import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/comment_input.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "تقييم الخدمة من عملائنا مالكي الحمامات",
          style: AppTextStyles.styleBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star_border,
                  color: Color(0xffFFD423), // لون النجمة دهبي
                  size: SizeConfig.w(18),
                ),
              ),
            ),
            SizedBox(width: 34),
             Text(
              "قيّم تجربتك معنا",
              style: AppTextStyles.styleSemiBold16(context).copyWith(
                color: Color(0xff555555),
                
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CommentInput(),
        const SizedBox(height: 16),

        /// شريط الترتيب
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Dropdown للأجدد
            Row(
              children: const [
                Icon(Icons.arrow_drop_down, color: Colors.black54),
                Text(
                  "الأجدد",
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),

            /// الترتيب حسب:
            const Text(
              "الترتيب حسب:",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),

            /// عدد التعليقات
            const Text(
              "5 تعليقات",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ],
    );
  }
}
