import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_loading_indecator.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/orders/presentation/manager/order_cubit.dart/order%20state.dart';
import 'package:plupool/features/orders/presentation/manager/order_cubit.dart/order_cubit.dart';
import 'package:plupool/features/products/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:plupool/features/products/presentation/cubits/product_cubit/product_state.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';
import 'package:plupool/features/search/presentation/manager/cubits/product_search_cubit/product_search_cubit.dart';
import 'package:plupool/features/search/presentation/manager/cubits/product_search_cubit/product_search_state.dart';

class AddOrderItemCard extends StatefulWidget {
  const AddOrderItemCard({super.key, required this.orderId});

  final int orderId;

  @override
  State<AddOrderItemCard> createState() => _AddOrderItemCardState();
}

class _AddOrderItemCardState extends State<AddOrderItemCard> {
  late TextEditingController quantityController;
  late TextEditingController searchController;

  bool isExpanded = false;

  int? selectedProductId;
  String? selectedProductName;

  @override
  void initState() {
    super.initState();
    quantityController = TextEditingController();
    searchController = TextEditingController();

    /// 👇 يجيب كل المنتجات
    context.read<ProductCubit>().fetchProducts();
  }

  @override
  void dispose() {
    quantityController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(16),
          vertical: SizeConfig.h(29),
        ),
        child: Container(
          width: SizeConfig.isWideScreen
              ? SizeConfig.screenWidth * 0.65
              : double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(16),
            vertical: SizeConfig.h(20),
          ),
          decoration: BoxDecoration(
            color: AppColors.kScaffoldColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// ===== SELECT + SEARCH =====
                TextFieldWithIcon(
                  hint: "اختار المنتج",
                  controller: searchController,
                  icon: Icons.inventory_2_outlined,
                  tailing: true,

                  /// 👇 لما تدوسي يفتح كل المنتجات
                  onTap: () {
                    setState(() {
                      isExpanded = true;
                    });

                    context.read<ProductSearchCubit>().clearSearch();
                  },

                  /// 👇 لما تكتبي يعمل سيرش
                  onChanged: (val) {
                    final cubit = context.read<ProductSearchCubit>();

                    if (val.isEmpty) {
                      cubit.clearSearch(); // يرجع كل المنتجات
                    } else {
                      cubit.search(val);
                    }
                  },
                ),

                /// ===== DROPDOWN =====
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 200),
                  crossFadeState: isExpanded
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,

                  firstChild: Column(
                    children: [
                      BlocBuilder<ProductSearchCubit, ProductSearchState>(
                        builder: (context, searchState) {
                          /// 🔍 لو فيه سيرش
                          if (searchState is ProductSearchLoading) {
                            return const Padding(
                              padding: EdgeInsets.all(10),
                              child: CustomLoadingIndecator(),
                            );
                          }

                          if (searchState is ProductSearchSuccess) {
                            final products = searchState.products;

                            if (products.isEmpty) {
                              return Center(child: ErrorText(message: "لا يوجد نتائج"));
                            }

                            return _buildList(products);
                          }

                          /// 📦 لو مفيش سيرش → كل المنتجات
                          return BlocBuilder<ProductCubit, ProductState>(
                            builder: (context, state) {
                              if (state is ProductLoading) {
                                return const CustomLoadingIndecator();
                              }

                              if (state is ProductLoaded) {
                                final products = state.products;

                                if (products.isEmpty) {
                                  return  Center(child: ErrorText(message:"لا يوجد منتجات"));
                                }

                                return _buildList(products);
                              }

                              if (state is ProductError) {
                                return Center(child: ErrorText(message:state.message));
                              }

                              return const SizedBox();
                            },
                          );
                        },
                      ),
                    ],
                  ),

                  secondChild: const SizedBox(),
                ),

                const SizedBox(height: 20),

                /// ===== QUANTITY =====
                TextFieldWithIcon(
                  controller: quantityController,
                  hint: "ادخل الكمية",
                  icon: Icons.format_list_numbered,
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 20),

                /// ===== BUTTON =====
                BlocBuilder<OrdersCubit, OrdersState>(
                  builder: (context, state) {
                    final isLoading = state is OrdersActionLoading;

                    return AddEditOfferViewFooter(
                      text: "اضافة",
                      onPressed: isLoading
                          ? null
                          : () {
                              if (selectedProductId == null) {
                                showCustomSnackBar(
                                  context: context,
                                  message: "اختار منتج الأول",
                                );
                                return;
                              }

                              if (quantityController.text.isEmpty) {
                                showCustomSnackBar(
                                  context: context,
                                  message: "ادخل الكمية",
                                );
                                return;
                              }

                              context.read<OrdersCubit>().addItem(
                                orderId: widget.orderId,
                                productId: selectedProductId!,
                                quantity: int.parse(quantityController.text),
                              );

                              Navigator.pop(context);
                            },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ===== LIST =====
  Widget _buildList(List products) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 200, // 👈 أقصى ارتفاع
      ),

      child: ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return ListTile(
            dense: true, // 👈 يقلل الارتفاع
            visualDensity: const VisualDensity(
              vertical: -4, // 👈 تقللي المسافة بين العناصر
            ),
            title: Text(
              product.name,
              style: AppTextStyles.styleMedium13(
                context,
              ).copyWith(color: AppColors.kprimarycolor),
            ),

            onTap: () {
              setState(() {
                selectedProductId = product.id;
                selectedProductName = product.name;
                searchController.text = product.name;
                isExpanded = false;
              });
            },
          );
        },
      ),
    );
  }
}
