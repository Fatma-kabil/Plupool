import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class ProjectLocationRow extends StatelessWidget {
  const ProjectLocationRow({super.key, required this.location});
  final String location;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          size: SizeConfig.w(15),
          color: Color(0xff777777),
        ),
        Text(location,style: AppTextStyles.styleRegular13(context).copyWith(color:Color(0xff777777),),),
      ],
    );
  }
}
