import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/location_row.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_avatar.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info.dart';
import 'package:plupool/features/orders/presentation/view/widgets/customer_order_card_header.dart';
import 'package:plupool/features/orders/presentation/view/widgets/total_fees_sectin.dart';
import 'package:plupool/features/store/domain/entities/store_rder_entity.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/info_col.dart';

class UserOrderDatailsViewBody extends StatelessWidget {
  const UserOrderDatailsViewBody({super.key, required this.order});
  final StoreOrderEntity order;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomerAvatar(imageUrl: order.customerProfileImage ?? ""),
              SizedBox(width: SizeConfig.w(7)),
              CustomerInfo(
                name: order.customerName,
                phone: order.deliveryPhone ?? order.customerPhone,
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(8)),

          InfoCol(label: "العنوان:", value: order.deliveryAddress),

          SizedBox(height: SizeConfig.h(8)),

          LocationRow(location: order.deliveryAddress),
          const SizedBox(height: 25),
          Container(
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
                CustomerOrderCardHeader(
                  orderNumber: order.orderNumber,
                  status: order.status,
                  createdAt: DateTime.parse(order.createdAt),
                ),

                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: order.items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: SizeConfig.h(10)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl:
                                  order.items[index].productImageUrl ?? "",
                              height: SizeConfig.isWideScreen
                                  ? SizeConfig.w(88)
                                  : SizeConfig.h(88),
                              width: SizeConfig.w(69),
                              fit: BoxFit.cover,
                              placeholder: (_, __) => Container(
                                height: SizeConfig.isWideScreen
                                    ? SizeConfig.w(88)
                                    : SizeConfig.h(88),
                                width: SizeConfig.w(69),
                                color: Colors.grey.shade300,
                              ),
                              errorWidget: (_, __, ___) => Container(
                                height: SizeConfig.isWideScreen
                                    ? SizeConfig.w(88)
                                    : SizeConfig.h(88),
                                width: SizeConfig.w(69),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.inventory_2_outlined,
                                  size: SizeConfig.w(18),
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: SizeConfig.w(10)),

                          /// Text
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  toArabicNumbers(
                                    "${order.items[index].quantity} ${order.items[index].productNameAr}",
                                  ),
                                  style: AppTextStyles.styleSemiBold14(
                                    context,
                                  ).copyWith(color: const Color(0xff7B7B7B)),
                                ),
                                SizedBox(height: SizeConfig.h(8)),
                                Text(
                                  toArabicNumbers(
                                    '${order.items[index].unitPrice} ج.م',
                                  ),
                                  textDirection: TextDirection.ltr,
                                  style: AppTextStyles.styleBold14(
                                    context,
                                  ).copyWith(color: const Color(0xff333333)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                TotalFeesSection(
                  total: order.totalAmount,
                  fees: order.deliveryFee,
                  totalWithFees: order.grandTotal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
