import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';

class BuildUserSection extends StatelessWidget {
  const BuildUserSection({super.key,required this.request});
  final ServiceRequest request;

  @override
  Widget build(BuildContext context) {
    return 
  /// ويدجت للمستخدم والموقع
 Row(
    textDirection: TextDirection.rtl,
    children: [
      CircleAvatar(radius:SizeConfig.w(16) , backgroundImage: AssetImage(request.userImage)),
       SizedBox(width: SizeConfig.w(8) ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            request.userName,
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: Color(0xff555555)),
          ),
          const SizedBox(height: 2),
          Row(
            textDirection: TextDirection.rtl,
            children: [
               Icon(
                Icons.location_on,
                size: SizeConfig.w(14) ,
                color: Color(0xff999999),
              ),
              //  const SizedBox(width: 3),
              Text(
                request.location,
                style: AppTextStyles.styleRegular13(
                  context,
                ).copyWith(color: Color(0xff999999)),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

  
}