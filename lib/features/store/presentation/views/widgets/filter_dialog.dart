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
  final Set<int> initialSelected;

  const FilterDialog({super.key, required this.initialSelected});

  @override
  State<FilterDialog> createState() => FilterDialogState();
}

class FilterDialogState extends State<FilterDialog> {
  late Map<int, bool> selectedCategories;
  List<CategoryEntity> categories = [];

  @override
  void initState() {
    super.initState();

    selectedCategories = {for (var id in widget.initialSelected) id: true};
  }

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
          bottom: SizeConfig.h(40),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Categories
            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const CustomLoadingIndecator();
                }

                if (state is CategoryError) {
                  return ErrorText(message: state.message);
                }

                if (state is CategorySuccess) {
                  categories = state.categories;

                  /// مهم جدًا 👇
                  for (var cat in categories) {
                    selectedCategories.putIfAbsent(
                      cat.id,
                      () => widget.initialSelected.contains(cat.id),
                    );
                  }
                  if (categories.isEmpty) {
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "مفيش تصنيفات متاحة 📭",
                        style: AppTextStyles.styleMedium16(
                          context,
                        ).copyWith(color: Colors.grey),
                      ),
                    );
                  }

                  return GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    childAspectRatio: 3.5,
                    children: categories.map((cat) {
                      return Row(
                        children: [
                          Checkbox(
                            value: selectedCategories[cat.id] ?? false,
                            activeColor: AppColors.kprimarycolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            side: BorderSide(
                              color: Color(0xffAAAAAA),
                              width: SizeConfig.w(2),
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
                              style: AppTextStyles.styleSemiBold16(
                                context,
                              ).copyWith(color: AppColors.ktextcolor),
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

            const SizedBox(height: 20),

            /// Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Apply
                ElevatedButton(
                  onPressed: () {
                    final selectedIds = selectedCategories.entries
                        .where((e) => e.value)
                        .map((e) => e.key)
                        .toSet();

                    Navigator.pop(context, selectedIds);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kprimarycolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      SizeConfig.isWideScreen ? SizeConfig.h(7) : 0,
                    ),
                    child: Text(
                      "تصفية",
                      style: AppTextStyles.styleBold16(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                ),

                /// Cancel
                CustomOutlinedBtn(text: "إلغاء"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
