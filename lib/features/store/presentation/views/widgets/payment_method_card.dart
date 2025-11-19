
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(15)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(15),
        vertical: SizeConfig.h(15),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffCDF7EC),
      ),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Text(
                "طريقة الدفع",
    
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: Color(0xff333333)),
              ),
    
              SizedBox(width: SizeConfig.w(4)),
              Icon(
                Icons.payments_outlined,
                color: Color(0xff05B285),
                size: SizeConfig.w(20),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(8)),
        
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Icon(
                Icons.check_circle,
                color:  Color(0xff05B285),
                size: SizeConfig.w(17),
              ),
              SizedBox(width: SizeConfig.w(4)),
              Text(
            //    textDirection: TextDirection.rtl,
                ". سيتم الدفع نقدًا عند استلام الطلب من المندوب",
    
                style: AppTextStyles.styleRegular13(
                  context,
                ).copyWith(color: Color(0xff777777)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
