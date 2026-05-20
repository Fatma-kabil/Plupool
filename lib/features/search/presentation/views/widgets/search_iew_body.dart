import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/products/data/models/product_params_model.dart';
import 'package:plupool/features/products/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:plupool/features/products/presentation/cubits/product_cubit/product_state.dart';
import 'package:plupool/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:plupool/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:plupool/features/store/presentation/views/widgets/product_grid_shimmer.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  void initState() {
    super.initState();

    context.read<ProductCubit>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /// 🔵 Search Field
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CustumSearchTextField(
              onChanged: (value) {
                context.read<ProductCubit>().fetchProducts(
                  ProductParams(search: value),
                );
              },
            ),
          ),
        ),

        /// 🔵 Title
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'نتائج البحث :',
              style: AppTextStyles.styleBold18(
                context,
              ).copyWith(color: Colors.black),
            ),
          ),
        ),

        /// 🔵 Body (states)
        BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return SliverToBoxAdapter(child: ProductGridShimmer());
            }

            if (state is ProductLoaded) {
              if (state.products.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(child: Text("لا توجد نتائج")),
                );
              }
              return SearchResultListView(products: state.products);
            }

            if (state is ProductError) {
              return SliverToBoxAdapter(
                child: Center(child: ErrorText(message: state.message)),
              );
            }

            return const SliverToBoxAdapter(child: SizedBox());
          },
        ),
      ],
    );
  }
}
