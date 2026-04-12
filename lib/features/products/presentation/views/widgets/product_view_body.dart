import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/products/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:plupool/features/products/presentation/cubits/product_cubit/product_state.dart';
import 'package:plupool/features/products/presentation/views/widgets/products_list.dart';
import 'package:plupool/features/products/presentation/views/widgets/product_view_header.dart';
import 'package:plupool/core/utils/widgets/filter_button.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/core/utils/store_filter.dart';
import 'package:plupool/features/store/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:plupool/features/store/presentation/views/widgets/filter_dialog.dart';

import 'package:plupool/features/products/data/models/product_params_model.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  StoreFilter? selected; // null → الكل
  int? selectedCategoryId; // null → الكل

  @override
  void initState() {
    super.initState();
    // أول ما الصفحة تفتح → كل المنتجات
    context.read<ProductCubit>().fetchProducts();
  }

  ProductParams get currentParams =>
      ProductParams(sortBy: selected?.apiValue, categoryId: selectedCategoryId);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: ProductViewHeader()),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),

        /// Row للـ sorting + filter button
        SliverToBoxAdapter(
          child: Row(
            children: [
              /// Dropdown للـ sorting
              FilterOption(
                icon: Icons.keyboard_arrow_down,
                value: selected?.label ?? "الكل",
                items: [
                  "الكل",
                  ...StoreFilter.values
                      .where((f) => f != StoreFilter.discount)
                      .map((f) => f.label)
                      .toList(),
                ],
                onChanged: (val) {
                  if (val == "الكل") {
                    setState(() => selected = null);
                  } else {
                    final newFilter = StoreFilter.values.firstWhere(
                      (f) => f.label == val,
                    );
                    setState(() => selected = newFilter);
                  }
                  // تحديث المنتجات
                  context.read<ProductCubit>().fetchProducts(currentParams);
                },
              ),

              const Spacer(),

              /// Filter button (Dialog)
              FilterButton(
                onTap: () async {
                  final categoryId = await showDialog<int?>(
                    context: context,
                    builder: (_) => BlocProvider.value(
                      value: context.read<CategoryCubit>(),
                      child: const FilterDialog(),
                    ),
                  );

                  setState(() => selectedCategoryId = categoryId);
                  context.read<ProductCubit>().fetchProducts(currentParams);
                },
              ),
            ],
          ),
        ),

        /// BlocBuilder للمنتجات
        BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (state is ProductLoaded) {
              if (state.products.isEmpty) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "لا توجد منتجات متاحة حالياً 🛒📭",
                        style: AppTextStyles.styleMedium20(
                          context,
                        ).copyWith(color: Colors.grey),
                      ),
                    ),
                  ),
                );
              }

              return ProductsList(products: state.products);
            }

            if (state is ProductError) {
              return SliverToBoxAdapter(
                child: Center(child: Text(state.message)),
              );
            }

            return const SliverToBoxAdapter(child: SizedBox());
          },
        ),
      ],
    );
  }
}
