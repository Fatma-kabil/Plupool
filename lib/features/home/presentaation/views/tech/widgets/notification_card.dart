
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String type;

  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color iconColor;

    if (type == "offer") {
      icon = Icons.local_offer_rounded;
      iconColor = const Color(0xffF7A9C4);
    } else {
      icon = Icons.access_time_filled;
      iconColor = const Color(0xff00B4D8);
    }

    return Container(
      margin:  EdgeInsets.only(bottom:SizeConfig.h(12) ),
      padding:  EdgeInsets.symmetric( vertical:  SizeConfig.h(14),horizontal: SizeConfig.w(14)),
      decoration: BoxDecoration(
       
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Row(
       
        children: [
          // النصوص
          Expanded(
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    textDirection: TextDirection.rtl,
                  title,
                  style:AppTextStyles.styleSemiBold16(context).copyWith(color: AppColors.ktextcolor)
                ),
                 SizedBox(height: SizeConfig.h(4)),
                Text(
                  subtitle,
                  style: AppTextStyles.styleRegular14(context).copyWith(color: Color(0xff999999))
                ),
                SizedBox(height: SizeConfig.h(4)),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                     Icon(Icons.access_time, size:SizeConfig.w(17) , color: Color(0xff777777)),
                     SizedBox(width:SizeConfig.w(4) ),
                    Text(
                      time,
                      style:AppTextStyles.styleRegular13(context).copyWith(color: Color(0xff525252))
                    ),
                  ],
                ),
              ],
            ),
          ),

           SizedBox(width: SizeConfig.w(10)),

          // الايقونة
          CircleAvatar(
            radius: SizeConfig.w(18),
            backgroundColor: iconColor.withOpacity(0.15),
            child: Icon(icon, color: iconColor, size: SizeConfig.w(22)),
          ),
        ],
      ),
    );
  }
}
