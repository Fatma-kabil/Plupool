import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/products/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:plupool/features/products/presentation/cubits/product_cubit/product_state.dart';
import 'package:plupool/features/store/presentation/views/widgets/product_grid_shimmer.dart';
import 'package:plupool/features/store/presentation/views/widgets/products_grid.dart';

class ProductGridBlocBuilder extends StatelessWidget {
  const ProductGridBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return ProductGridShimmer();
        }

        if (state is ProductLoaded) {
          if (state.products.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "لا توجد منتجات متاحة حالياً 🛒📭",
                  style: AppTextStyles.styleMedium16(
                    context,
                  ).copyWith(color: Colors.grey),
                ),
              ),
            );
          }

          return ProductsGrid(products: state.products);
        }

        if (state is ProductError) {
          return SliverToBoxAdapter(child: ErrorText(message: state.message));
        }

        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
