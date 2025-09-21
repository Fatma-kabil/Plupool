
import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/load_more_button.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/review_card.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            /// Dropdown للأجدد
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff999999)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Row(
                  children: [
                    Icon(Icons.arrow_drop_down, color: Color(0xff999999)),
                    SizedBox(width: 5),
                    Text(
                      "الأجدد",
                      style: AppTextStyles.styleRegular16(
                        context,
                      ).copyWith(color: Color(0xff999999)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 5,),
        
            /// الترتيب حسب:
            Text(
              textDirection: TextDirection.rtl,
              "الترتيب حسب: ",
              style: AppTextStyles.styleRegular16(
                context,
              ).copyWith(color: Color(0xff777777)),
            ),
            Spacer(),
        
            /// عدد التعليقات
            Text(
              textDirection: TextDirection.rtl,
              " 5تعليقات",
              style: AppTextStyles.styleRegular16(
                context,
              ).copyWith(color: Color(0xff555555)),
            ),
          ],
        ),
               
        const SizedBox(height: 27),
        
        /// قائمة الريفيوهات
        ListView.builder(
          itemCount: reviews.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ReviewCard(review: reviews[index]);
          },
        ),
        
        const SizedBox(height: 25),
        Center(
          child: LoadMoreButton(
            onPressed: () {
              // TODO: add navigation or load more
            },
          ),
        ),
         const SizedBox(height: 51),
      ],
    );
  }
}