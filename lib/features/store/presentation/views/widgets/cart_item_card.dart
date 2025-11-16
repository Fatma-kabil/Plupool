import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/views/widgets/Qty_Btn.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: SizeConfig.h(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(8),vertical:   SizeConfig.h(6)),
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/mach_pro2.png",
              width: SizeConfig.w(70),
              height: SizeConfig.h(88),
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: SizeConfig.w(12)),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "مضخة مياه عالية الكفاءة",
                style: AppTextStyles.styleSemiBold14(context).copyWith(color: Color(0xff7B7B7B)),
              ),
              SizedBox(height: SizeConfig.h(5)),
              Text(
                "3000 EGP",
                style: AppTextStyles.styleBold14(context).copyWith(color: AppColors.ktextcolor),
              ),
             
            ],
          ),
          Spacer(),
           Row(
                children: [
                  QtyBtn(icon:Icons.remove,backgroundcolor: Color(0xffCDCDCD),onTap: () {
                    
                  },),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(8)),
                    child: Text(
                      "2",
                      style: AppTextStyles.styleRegular16(context).copyWith(color: AppColors.ktextcolor),
                    ),
                  ),
                  QtyBtn(icon:   Icons.add,backgroundcolor: AppColors.kprimarycolor,onTap: () {
                    
                  },),
                ],

              ),
             

        //  Column(
          //  children: [
            //   Text(
              //  "الإجمالي: 6000 EGP",
             //   style: AppTextStyles.styleRegular14(context)
               //     .copyWith(color: Colors.grey),
            //  ),
             
          //    TextButton.icon(
            //    onPressed: () {},
              //  icon: const Icon(Icons.delete, color: Colors.red),
              //  label: const Text("حذف",
                //    style: TextStyle(color: Colors.red)),
            //  ),
            ],
          )
        
      );
    
  }

}
