
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/products/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:plupool/features/products/presentation/cubits/product_cubit/product_state.dart';
import 'package:plupool/features/products/presentation/views/widgets/products_Shimmer_list.dart';
import 'package:plupool/features/products/presentation/views/widgets/products_list.dart';

class ProductBlocBuilder extends StatelessWidget {
  const ProductBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return ProductsShimmerList();
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
    );
  }
}
