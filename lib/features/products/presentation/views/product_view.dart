import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';
import 'package:plupool/features/products/presentation/views/widgets/product_view_body.dart';
import 'package:plupool/features/products/presentation/views/widgets/products_Shimmer_list.dart';
import 'package:plupool/features/products/presentation/views/widgets/products_list.dart';
import 'package:plupool/features/search/presentation/manager/cubits/product_search_cubit/product_search_cubit.dart';
import 'package:plupool/features/search/presentation/manager/cubits/product_search_cubit/product_search_state.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductSearchCubit(sl()),
      child: Builder(
        builder: (context) {
          SizeConfig.init(context);

          return Directionality(
            textDirection: TextDirection.rtl,
            child: SafeArea(
              child: Scaffold(
                key: scaffoldkey,

                appBar: CustomAppBar(
                  onChanged: (value) {
                    print("typing: $value"); // مهم جدًا
                    try {
                      BlocProvider.of<ProductSearchCubit>(
                        context,
                      ).search(value);
                      print("CUBIT FOUND ✅");
                    } catch (e) {
                      print("CUBIT NOT FOUND ❌");
                    }
                  },
                  isSearch: true,
                  onPressed: () {
                    scaffoldkey.currentState!.openDrawer();
                  },
                ),

                drawer: AppDrawer(),

                body: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.w(13),
                    vertical: SizeConfig.h(15),
                  ),

                  child: BlocBuilder<ProductSearchCubit, ProductSearchState>(
                    builder: (context, state) {
                      print("STATE: $state");

                      return CustomScrollView(
                        slivers: [
                          /// 🔵 Loading
                          if (state is ProductSearchLoading)
                            ProductsShimmerList()
                          /// 🔵 Success
                          else if (state is ProductSearchSuccess)
                            state.products.isEmpty
                                ? const SliverFillRemaining(
                                    child: Center(child: ErrorText( message:  "مفيش نتائج 😢")),
                                  )
                                : ProductsList(products: state.products)
                          /// 🔵 Error
                          else if (state is ProductSearchError)
                            SliverFillRemaining(
                              child: Center(child: ErrorText( message:  state.message)),
                            )
                          /// 🔵 Default
                          else
                            const SliverFillRemaining(child: ProductViewBody()),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
