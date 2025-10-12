import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';

class BuildDataTimeRow extends StatelessWidget {
  const BuildDataTimeRow({super.key,required this.request});
   final ServiceRequest request;


  @override
  Widget build(BuildContext context) {
    return  /// ويدجت للتاريخ والوقت
   Row(
    textDirection: TextDirection.rtl,
    children: [
       Icon(Icons.calendar_today, size:SizeConfig.w(12) , color: Color(0xff999999)),
       SizedBox(width: SizeConfig.w(6)),
      Text(
        textDirection: TextDirection.rtl,
        '${request.date}   - ${request.time}',
        style: AppTextStyles.styleRegular13(
          context,
        ).copyWith(color: Color(0xff999999)),
      ),
    ],
  );
}

  }
