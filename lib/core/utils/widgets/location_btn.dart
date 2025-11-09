
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/open_location.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';

class LocationBtn extends StatelessWidget {
  const LocationBtn({
    super.key,
    required this.request,
    required this.colors,
  });

  final ServiceRequest request;
  final Map<String, dynamic> colors;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => openLocation(context,request.location) ,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: colors['labelText']),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(14),
            vertical: SizeConfig.h(6),
          ),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
          
              
      
                 Icon(
                  Icons.location_on,
                  color: colors['labelText'],
                  size: SizeConfig.w(16),
                ),
              
              Text(
                'الموقع',
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: colors['labelText']),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
