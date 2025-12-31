
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/open_location.dart';
import 'package:plupool/core/utils/size_config.dart';

class LocationRow extends StatelessWidget {
  const LocationRow({super.key, required this.location});
  final String location;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openLocation(context, location);
      },
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Icon(
            Icons.location_on_outlined,
            color:Color(0xff0077B6),
            size: SizeConfig.w(20),
          ),
          SizedBox(width: SizeConfig.w(2)),
          Text(
            "عرض على الخريطة",
            style: AppTextStyles.styleBold13(context).copyWith(
              color: Color(0xff0077B6),
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
