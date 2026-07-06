import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/store/presentation/cubits/cart_cubit.dart/cart_cubit.dart';
import 'package:plupool/features/store/presentation/cubits/cart_cubit.dart/cart_state.dart';
import 'package:plupool/features/store/presentation/views/widgets/cart_item_card.dart';
import 'package:plupool/features/store/presentation/views/widgets/cart_item_card_shimmer.dart';
import 'package:plupool/features/store/presentation/views/widgets/empty_card_section.dart';
import 'package:plupool/features/store/presentation/views/widgets/verified_btn.dart';

class CartFilledSection extends StatefulWidget {
  const CartFilledSection({super.key});

  @override
  State<CartFilledSection> createState() => _CartFilledSectionState();
}

class _CartFilledSectionState extends State<CartFilledSection> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<CartCubit>().getCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          showCustomSnackBar(context: context, message: state.errorMessage!);
          context.read<CartCubit>().clearError();
        }
      },
      builder: (context, state) {
        if (state.isCartLoading) {
          return ListView.builder(
            itemCount: 3,
            itemBuilder: (_, __) => const CartItemCardShimmer(),
          );
        }

        final cart = state.cart!;

        if (cart.items.isEmpty) {
          return const EmptyCartSection(
            icon: Icons.remove_shopping_cart_outlined,
            tittle: "السله فارغه",
          );
        }

        return Column(
          children: [
            SizedBox(height: SizeConfig.ismidwidthScreen ? SizeConfig.h(8) : 0),

            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (_, i) {
                  return CartItemCard(item: cart.items[i]);
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.h(10)),
              child: VerifiedBtn(
                onPressed: () {
                  context.push('/ordersummaryview');
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
