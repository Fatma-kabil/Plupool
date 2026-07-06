import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/products/domain/entities/product_entity.dart';
import 'package:plupool/features/store/presentation/cubits/cart_cubit.dart/cart_cubit.dart';
import 'package:plupool/features/store/presentation/cubits/cart_cubit.dart/cart_state.dart';
import 'package:plupool/features/store/presentation/views/widgets/product_card.dart';

class ProductsGrid extends StatelessWidget {
  final List<Product> products;

  const ProductsGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listenWhen: (previous, current) {
        return previous.isSuccess != current.isSuccess;
      },

      listener: (context, state) {
        if (state.isSuccess) {
          print("✅ Add To Cart Success");
          showCustomSnackBar(
            context: context,
            message: "تمت إضافة المنتج إلى السلة بنجاح 🛒",
            isSuccess: true,
          );
        }

        if (state.errorMessage != null) {
          print("❌ ${state.errorMessage}");
          showCustomSnackBar(
            context: context,
            message: "فشل إضافة المنتج إلى السلة  🛒",
          );
        }
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:
                SizeConfig.screenHeight > 2 * SizeConfig.screenWidth
                ? 0.62
                : SizeConfig.screenWidth == 800
                ? .82
                : SizeConfig.screenWidth > 800
                ? 0.91
                : 0.71,
            crossAxisSpacing: SizeConfig.w(12),
            mainAxisSpacing: SizeConfig.w(12),
          ),
          itemBuilder: (_, i) => ProductCard(product: products[i]),
        ),
      ),
    );
  }
}
