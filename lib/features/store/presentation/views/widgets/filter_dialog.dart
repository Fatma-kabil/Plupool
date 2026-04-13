import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_loading_indecator.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/store/domain/entities/category_entity.dart';
import 'package:plupool/features/store/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:plupool/features/store/presentation/cubits/category_cubit/category_state.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => FilterDialogState();
}

class FilterDialogState extends State<FilterDialog> {
  Map<int, bool> selectedCategories = {};
  List<CategoryEntity> categories = [];

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
            /// 🟡 Categories from API
            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(child: CustomLoadingIndecator());
                }

                if (state is CategoryError) {
                 ErrorText(message: state.message);
                }

                if (state is CategorySuccess) {
                  categories = state.categories;

                  /// init map مرة واحدة
                  for (var cat in categories) {
                    selectedCategories.putIfAbsent(cat.id, () => false);
                  }

                  if (categories.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "مفيش تصنيفات متاحة 📭",
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }

                  return GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    childAspectRatio: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    physics: const NeverScrollableScrollPhysics(),
                    children: categories.map((cat) {
                      return Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Checkbox(
                            value: selectedCategories[cat.id],
                            activeColor: AppColors.kprimarycolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            side:  BorderSide(
                              color: Color(0xffAAAAAA),
                              width:SizeConfig.w(2) ,
                            ),
                            onChanged: (val) {
                              setState(() {
                                selectedCategories[cat.id] = val ?? false;
                              });
                            },
                          ),
                          Expanded(
                            child: Text(
                              cat.name,
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: AppTextStyles.styleSemiBold16(context)
                                  .copyWith(color: AppColors.ktextcolor),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  );
                }

                return const SizedBox();
              },
            ),

            const SizedBox(height: 50),

            /// 🟡 Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Apply Filter
                ElevatedButton(
                  onPressed: () {
                    final selected = selectedCategories.entries.firstWhere(
                      (e) => e.value,
                      orElse: () => const MapEntry(-1, false),
                    );

                    Navigator.pop(
                      context,
                      selected.key == -1 ? null : selected.key,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kprimarycolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                        SizeConfig.isWideScreen ? SizeConfig.h(7) : 0),
                    child: Text(
                      "تصفية",
                      style: AppTextStyles.styleBold16(context)
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),

                /// Cancel
                CustomOutlinedBtn(
                  text: "إلغاء",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}