import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/orders/presentation/view/widgets/total_fees_sectin.dart';
import 'package:plupool/features/support/presentation/views/widgets/details_btn.dart';

class OrderDatails extends StatelessWidget {
  const OrderDatails({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "عدد المنتجات : 6 ",
              textDirection: TextDirection.rtl,
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: Color(0xff555555)),
            ),
            Spacer(),
            DetailsBtn(onTap: onTap),
          ],
        ),
        SizedBox(height: SizeConfig.h(8)),
        TotalFeesSection(),
      ],
    );
  }
}
