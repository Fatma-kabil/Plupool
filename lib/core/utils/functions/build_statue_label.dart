 import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/domain/entities/request_status.dart';

/// ويدجت لعرض حالة الطلب
  Widget buildStatusLabel(Map<String, dynamic> colors, BuildContext context, RequestStatus status, ) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical:SizeConfig.h(5) , horizontal:SizeConfig.w(15) ),
      decoration: BoxDecoration(
        color: colors['labelBg'],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        getStatusText(status),
        style: AppTextStyles.styleSemiBold13(
          context,
        ).copyWith(color: colors['labelText']),
      ),
    );
  }
