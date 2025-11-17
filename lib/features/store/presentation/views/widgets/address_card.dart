
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
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
        color: Color(0xffCCE4F0),
      ),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Text(
                "العنوان ورقم الهاتف",
    
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: Color(0xff333333)),
              ),
              Spacer(),
              Text(
                "تعديل",
    
                style: AppTextStyles.styleSemiBold15(context),
              ),
              SizedBox(width: SizeConfig.w(4)),
              Icon(
                Icons.edit_note,
                color: AppColors.kprimarycolor,
                size: SizeConfig.w(20),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(6)),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Color(0xffBBBBBB),
                size: SizeConfig.w(17),
              ),
              SizedBox(width: SizeConfig.w(2)),
              Text(
                "شارع الجمهورية، الدور الثالث، شقة 12، القاهرة",
    
                style: AppTextStyles.styleRegular13(
                  context,
                ).copyWith(color: Color(0xff777777)),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(4)),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Icon(
                Icons.phone_rounded,
                color: Color(0xffBBBBBB),
                size: SizeConfig.w(17),
              ),
              SizedBox(width: SizeConfig.w(2)),
              Text(
                "+20 123 456 7890",
    
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
