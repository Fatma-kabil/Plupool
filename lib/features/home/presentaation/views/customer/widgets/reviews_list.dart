import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/load_more_button.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/review_card.dart';

class ReviewsList extends StatefulWidget {
  const ReviewsList({super.key});

  @override
  State<ReviewsList> createState() => _ReviewsListState();
}

class _ReviewsListState extends State<ReviewsList> {
  String selected = "الكل";

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        SizedBox(height: 15,),
        Row(
         
          children: [
             Text(
              textDirection: TextDirection.rtl,
              " 5تعليقات",
              style: AppTextStyles.styleRegular16(
                context,
              ).copyWith(color: Color(0xff555555)),
            ),
            Spacer(),
            /// Dropdown للأجدد
            FilterOption(
              value: selected,
              items: const ["الكل", "الأحدث", "الأقدم"],
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    selected = val;
                  });
                }
              },
            ),


            /// عدد التعليقات
           
          ],
        ),

        const SizedBox(height: 20),

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
