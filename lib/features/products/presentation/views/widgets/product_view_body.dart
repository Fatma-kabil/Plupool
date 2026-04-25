import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/products/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:plupool/features/products/presentation/views/widgets/product_bloc_builder.dart';
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
  StoreFilter? selected;
  Set<int> selectedCategoryIds = {}; // ✅ بدل int واحد

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchProducts();
  }

  ProductParams get currentParams => ProductParams(
    sortBy: selected?.apiValue,
    categoryIds: selectedCategoryIds.isEmpty
        ? null
    //    : selectedCategoryIds.first,
        : selectedCategoryIds.toList(),
  );

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: ProductViewHeader()),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),

        SliverToBoxAdapter(
          child: Row(
            children: [
              /// Sorting
              FilterOption(
                icon: Icons.keyboard_arrow_down,
                value: selected?.label ?? "الكل",
                items: [
                  "الكل",
                  ...StoreFilter.values
                      .where((f) => f != StoreFilter.discount)
                      .map((f) => f.label)
                      ,
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

                  context.read<ProductCubit>().fetchProducts(currentParams);
                },
              ),

              const Spacer(),

              /// Filter Dialog
              FilterButton(
                onTap: () async {
                  final result = await showDialog<Set<int>>(
                    context: context,
                    builder: (_) => BlocProvider.value(
                      value: context.read<CategoryCubit>(),
                      child: FilterDialog(initialSelected: selectedCategoryIds),
                    ),
                  );

                  if (result != null) {
                    setState(() => selectedCategoryIds = result);

                    context.read<ProductCubit>().fetchProducts(currentParams);
                  }
                },
              ),
            ],
          ),
        ),

        const ProductBlocBuilder(),
      ],
    );
  }
}
