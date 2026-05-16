import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/load_more_button.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/review_card.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/reviews_shimmer.dart';
import 'package:plupool/features/rating/presentation/manager/cubits/rating_cubit/ratings_cubit.dart';
import 'package:plupool/features/rating/presentation/manager/cubits/rating_cubit/ratings_state.dart';

class ReviewsList extends StatefulWidget {
  const ReviewsList({super.key});

  @override
  State<ReviewsList> createState() => _ReviewsListState();
}

class _ReviewsListState extends State<ReviewsList> {
  String selected = "الكل";

  int _visibleCount = 4; // 👈 الجديد فقط

  @override
  void initState() {
    super.initState();
    context.read<RatingsCubit>().getRatings(status: "approved");
  }

  String? get sortBy {
    switch (selected) {
      case "الأحدث":
        return "newest";
      case "الأقدم":
        return "oldest";
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),

        /// Header
        BlocBuilder<RatingsCubit, RatingsState>(
          builder: (context, state) {
            int count = 0;

            if (state is RatingsSuccess) {
              count = state.data.total;
            }

            return Row(
              children: [
                Text(
                  "${toArabicNumbers(count.toString())} تعليق",
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.styleRegular16(
                    context,
                  ).copyWith(color: const Color(0xff555555)),
                ),
                const Spacer(),
                FilterOption(
                  value: selected,
                  items: const ["الكل", "الأحدث", "الأقدم"],
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        selected = val;
                        _visibleCount = 4; // 👈 reset عند الفلتر
                      });

                      context
                          .read<RatingsCubit>()
                          .getRatings(sortBy: sortBy);
                    }
                  },
                ),
              ],
            );
          },
        ),

        const SizedBox(height: 20),

        /// Reviews
        BlocBuilder<RatingsCubit, RatingsState>(
          builder: (context, state) {
            if (state is RatingsLoading) {
              return ReviewsShimmer();
            }

            if (state is RatingsError) {
              return Center(child: ErrorText(message: state.message));
            }

            if (state is RatingsSuccess) {
              if (state.data.ratings.isEmpty) {
                return const Center(
                  child: ErrorText(message: "لا توجد تقييمات"),
                );
              }

              final reviews = state.data.ratings;

              final visibleReviews = reviews.length > _visibleCount
                  ? reviews.sublist(0, _visibleCount)
                  : reviews;

              return Column(
                children: [
                  ListView.builder(
                    itemCount: visibleReviews.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final review = visibleReviews[index];
                      return ReviewCard(review: review);
                    },
                  ),

                  const SizedBox(height: 25),

                  /// Load More
                  if (_visibleCount < reviews.length)
                    Center(
                      child: LoadMoreButton(
                        onPressed: () {
                          setState(() {
                            _visibleCount += 4;
                          });
                        },
                      ),
                    ),

                  const SizedBox(height: 51),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ],
    );
  }
}