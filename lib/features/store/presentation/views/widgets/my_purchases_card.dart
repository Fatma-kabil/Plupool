import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/domain/entities/store_rder_entity.dart';
import 'package:plupool/features/store/presentation/views/widgets/time_date_row.dart';
import 'package:plupool/features/store/presentation/views/widgets/total_and_status.dart';

class MyPurchasesCard extends StatelessWidget {
  const MyPurchasesCard({super.key, required this.order});
  final StoreOrderEntity order;
  @override
  Widget build(BuildContext context) {
    final firstItem = order.items.first;
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(10),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                toArabicNumbers("طلب رقم ${order.orderNumber}"),
                textDirection: TextDirection.rtl,
                style: AppTextStyles.styleSemiBold14(
                  context,
                ).copyWith(color: Color(0xff7B7B7B)),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  context.push(
                    "/userordrdetailsview",
                    extra: order,
                  ); // Handle the "View Details" action here
                },
                child: Row(
                  children: [
                    Text(
                      "تفاصيل",
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: AppColors.kprimarycolor),
                    ),
                    SizedBox(width: SizeConfig.w(2)),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.kprimarycolor,
                      size: SizeConfig.w(15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(4)),
          TimeDateRow(formattedDate: formatArabicDate(order.createdAt)),
          SizedBox(height: SizeConfig.h(4)),
          Divider(color: AppColors.textFieldBorderColor),
          SizedBox(height: SizeConfig.h(4)),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: firstItem.productImageUrl != null
                    ? Image.network(
                        firstItem.productImageUrl ?? "",
                        width: SizeConfig.w(69),
                        height: SizeConfig.h(88),
                        fit: BoxFit.cover,

                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: SizeConfig.w(69),
                            height: SizeConfig.h(88),
                            color: Colors.grey.shade200,
                            child: const Icon(Icons.image_not_supported),
                          );
                        },
                      )
                    : Container(
                        width: SizeConfig.w(69),
                        height: SizeConfig.h(88),
                        color: Colors.grey.shade200,
                        child: const Icon(Icons.image_not_supported),
                      ),
              ),

              SizedBox(width: SizeConfig.w(12)),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      toArabicNumbers(
                        "${firstItem.quantity} ${firstItem.productNameAr}",
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: AppTextStyles.styleSemiBold14(
                        context,
                      ).copyWith(color: const Color(0xff7B7B7B)),
                    ),

                    SizedBox(height: SizeConfig.h(5)),

                    Text(
                      toArabicNumbers(
                        "${firstItem.unitPrice.toStringAsFixed(0)} ج.م",
                      ),
                      style: AppTextStyles.styleBold14(
                        context,
                      ).copyWith(color: AppColors.ktextcolor),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: SizeConfig.h(4)),
          Divider(color: AppColors.textFieldBorderColor),
          SizedBox(height: SizeConfig.h(4)),
          TotalAndStatus(total: order.grandTotal, status: order.status),
        ],
      ),
    );
  }
}
