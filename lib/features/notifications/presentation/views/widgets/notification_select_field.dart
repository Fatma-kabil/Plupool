import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/notifications/data/models/notifiction_type_model.dart';

class NotificationSelectField extends StatelessWidget {
  final NotificationType? selected;


  const NotificationSelectField({
    super.key,
    required this.selected,
  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric( vertical: SizeConfig.h(SizeConfig.isWideScreen ? 9 : 11),
            horizontal: SizeConfig.w(12),),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          if (selected != null)
            Icon(selected!.icon, color: AppColors.ktextcolor,size: SizeConfig.w(15),),
          if (selected != null)  SizedBox(width: SizeConfig.w(6)
          ),
    
          Expanded(
            child: Text(
              selected?.title ?? 'اختر نوع الإشعار...',
              style: AppTextStyles.styleRegular14(
            context,
          ).copyWith(color:selected==null? AppColors.hintTextColor:AppColors.ktextcolor),
         

            ),
          ),
           Icon(Icons.keyboard_arrow_down,color: Color(0xffBBBBBB),size: SizeConfig.w(14),),
        ],
      ),
    );
  }
}
