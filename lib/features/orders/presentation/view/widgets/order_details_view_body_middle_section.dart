import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/orders/domain/entities/order_entity.dart';
import 'package:plupool/features/orders/presentation/manager/order_cubit.dart/order%20state.dart';
import 'package:plupool/features/orders/presentation/manager/order_cubit.dart/order_cubit.dart';
import 'package:plupool/features/orders/presentation/view/widgets/customer_order_card_header.dart';
import 'package:plupool/features/orders/presentation/view/widgets/order_details_shimmer.dart';
import 'package:plupool/features/orders/presentation/view/widgets/product_details_row.dart';
import 'package:plupool/features/orders/presentation/view/widgets/total_fees_sectin.dart';

class OrderDetailsViewBodyMiddleSection extends StatelessWidget {
  const OrderDetailsViewBodyMiddleSection({super.key, required this.model});

  final OrderEntity model;

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrdersCubit, OrdersState>(
      listener: (context, state) {
        if (state is OrdersDeleteItemSuccess) {
          Navigator.pop(context); // يقفل الديالوج بس

          showCustomSnackBar(
            context: context,
            message: "تم حذف المنتج بنجاح 🗑️",
            isSuccess: true,
          );
        }
       

        if (state is OrdersActionError) {
          Navigator.pop(context);

          showCustomSnackBar(context: context, message: state.message);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(15),
          vertical: SizeConfig.h(12),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.textFieldBorderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            CustomerOrderCardHeader(model: model),

            Padding(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.h(10)),
              child: Divider(),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: model.items.length,
              itemBuilder: (context, index) {
                return ProductDetailsRow(
                  orderr: model.items[index],
                  orderId: model.id,
                );
              },
            ),
            TotalFeesSection(
              total: model.totalAmount,
              fees: model.deliveryFee,
              totalWithFees: model.grandTotal,
            ),
          ],
        ),
      ),
    );
  }
}
