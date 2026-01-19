import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';
import 'package:plupool/features/products/presentation/views/widgets/edit_product_view_body.dart';
import 'package:plupool/features/store/data/models/product_model.dart';

class EditProductView extends StatefulWidget {
  const EditProductView({super.key,required this.product});
   final ProductModel product;

  @override
  State<EditProductView> createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
 final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          key: scaffoldkey,
          appBar: CustomAppBar(
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
            child: EditProductViewBody(product: widget.product,),
          ),
        ),
      ),
    );
  }
}
