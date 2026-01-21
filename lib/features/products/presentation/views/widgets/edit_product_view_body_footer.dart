import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';

class EditProductViewBodyFooter extends StatelessWidget {
  const EditProductViewBodyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomOutlinedBtn(
          text: 'تعديل',
          width: SizeConfig.w(145),
          onPressed: () {},
          trailing: Icon(
            Icons.edit,
            color: AppColors.kprimarycolor,
            size: SizeConfig.w(20),
          ),

          padding: 10,
        ),
        CustomOutlinedBtn(
          text: 'حذف المنتج',
          width: SizeConfig.w(145),
          onPressed: () {
            
          },
          trailing: Icon(
            Icons.delete_outline_outlined,
            color: Color(0xffE63946),
            size: SizeConfig.w(20),
          ),
          color: Color(0xffE63946),
          padding: 10,
        ),
      ],
    );
  }
}
