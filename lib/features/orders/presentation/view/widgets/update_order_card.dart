import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/orders/presentation/manager/order_cubit.dart/order%20state.dart';
import 'package:plupool/features/orders/presentation/manager/order_cubit.dart/order_cubit.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';

class UpdateOrderCard extends StatefulWidget {
  const UpdateOrderCard({
    super.key,
    required this.orderId,
    required this.itemId,
    required this.qty,
    required this.productName,
  });

  final int orderId;
  final int itemId;
  final int qty;
  final String productName;

  @override
  State<UpdateOrderCard> createState() => _UpdateOrderCardState();
}

class _UpdateOrderCardState extends State<UpdateOrderCard> {
  late TextEditingController quantityController;

  @override
  void initState() {
    super.initState();

    quantityController = TextEditingController(text: widget.qty.toString());
  }

  @override
  void dispose() {
    quantityController.dispose();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ===== Current Product =====
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.w(12),
                    vertical: SizeConfig.h(8),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffCCE4F0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.inventory_2_outlined,
                            color: const Color(0xff2B8EC2),
                            size: SizeConfig.w(20),
                          ),
                          SizedBox(width: SizeConfig.w(6)),
                          Text(
                            "المنتج الحالي",
                            style: AppTextStyles.styleBold16(
                              context,
                            ).copyWith(color: AppColors.ktextcolor),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.h(6)),
                      Text(
                        widget.productName,
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: const Color(0xff7B7B7B)),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                /// quantity
                TextFieldWithIcon(
                  controller: quantityController,
                  hint: "ادخل الكمية الجديدة",
                  icon: Icons.format_list_numbered,
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 25),

                /// save button
                BlocBuilder<OrdersCubit, OrdersState>(
                  builder: (context, state) {
                    final isLoading = state is OrdersActionLoading;

                    return AddEditOfferViewFooter(
                      text: "حفظ",
                      buttonWidth: SizeConfig.isWideScreen
                          ? SizeConfig.w(90)
                          : SizeConfig.w(140),
                      onPressed: isLoading
                          ? null
                          : () {
                              context.read<OrdersCubit>().updateItem(
                                orderId: widget.orderId,
                                itemId: widget.itemId,
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
}
