import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/map_rating_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/rating/presentation/manager/cubits/rating_cubit/ratings_cubit.dart';
import 'package:plupool/features/rating/presentation/manager/cubits/rating_cubit/ratings_state.dart';
import 'package:plupool/features/rating/presentation/views/widgets/admin_rating_card.dart';
import 'package:plupool/features/rating/presentation/views/widgets/ratings_sliver_shimmer.dart';

class AdminRatingViewBody extends StatefulWidget {
  const AdminRatingViewBody({super.key});

  @override
  State<AdminRatingViewBody> createState() => _AdminRatingViewBodyState();
}

class _AdminRatingViewBodyState extends State<AdminRatingViewBody> {
  /// الفلتر الحالي قبل وأثناء البحث
  String selected = "معلق";

  /// قيمة البحث
  String _search = "";

  bool get isSearching => _search.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RatingsCubit>().getRatings(
        status: mapStatus(selected),
      );
    });
  }

  /// 🔍 البحث
  void onSearchChanged(String value) {
    final searchValue = value.trim();

    setState(() {
      _search = searchValue;
    });

    /// لو فيه بحث:
    /// نبعت search فقط
    /// ومش نبعت status
    if (searchValue.isNotEmpty) {
      context.read<RatingsCubit>().getRatings(
        search: searchValue,
      );
    } else {
      /// لو البحث اتمسح:
      /// نرجع لنفس الفلتر اللي كان مختار قبل البحث
      context.read<RatingsCubit>().getRatings(
        status: mapStatus(selected),
      );
    }
  }

  /// 🧹 مسح البحث
  void clearSearch() {
    setState(() {
      _search = "";
    });

    /// رجوع للفلتر السابق
    context.read<RatingsCubit>().getRatings(
      status: mapStatus(selected),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingsCubit, RatingsState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            /// =========================
            /// عنوان البحث
            /// =========================
            SliverToBoxAdapter(
              child: Text(
                'ابحث عن شخص:',
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(
                  color: AppColors.ktextcolor,
                ),
              ),
            ),

            /// =========================
            /// Search
            /// =========================
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.w(4),
                  vertical: SizeConfig.h(15),
                ),
                child: CustomSearchPerson(
                  hintText: "ابحث باسم الشخص او رقم الهاتف",
                  onChanged: onSearchChanged,
                ),
              ),
            ),

            /// =========================
            /// Filter
            /// =========================
            /// الفلتر يختفي أثناء البحث
            if (!isSearching)
              SliverToBoxAdapter(
                child: FilterOption(
                  value: selected,
                  items: const [
                    "معلق",
                    "موافق عليه",
                    "مرفوض",
                  ],
                  onChanged: (val) {
                    if (val == null) return;

                    setState(() {
                      selected = val;
                    });

                    /// لما المستخدم يغير الفلتر
                    /// نلغي البحث ونجيب بيانات الفلتر الجديد
                    setState(() {
                      _search = "";
                    });

                    context.read<RatingsCubit>().getRatings(
                      status: mapStatus(val),
                    );
                  },
                ),
              ),

            /// =========================
            /// Loading
            /// =========================
            if (state is RatingsLoading)
              const RatingsSliverShimmer()

            /// =========================
            /// Error
            /// =========================
            else if (state is RatingsError)
              SliverFillRemaining(
                child: Center(
                  child: ErrorText(
                    message: state.message,
                  ),
                ),
              )

            /// =========================
            /// Success
            /// =========================
            else if (state is RatingsSuccess)
              state.data.ratings.isEmpty
                  ? const SliverFillRemaining(
                      child: Center(
                        child: ErrorText(
                          message: "لا توجد نتائج",
                        ),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final rating =
                              state.data.ratings[index];

                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                            ),
                            child: AdminRatingCard(
                              rating: rating,
                            ),
                          );
                        },
                        childCount: state.data.ratings.length,
                      ),
                    )

            /// =========================
            /// Initial
            /// =========================
            else
              const SliverToBoxAdapter(
                child: SizedBox(),
              ),
          ],
        );
      },
    );
  }
}