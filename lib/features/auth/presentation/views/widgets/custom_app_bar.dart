import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    
   bool isWide =SizeConfig.screenWidth > 800;

    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.h(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: AppTextStyles.styleBold20(
              context,
            ).copyWith(fontSize:  isWide ? 50 :22),
          ),
          SizedBox(width: SizeConfig.w(65)),
          IconButton(
            icon: Icon(Icons.chevron_right, size: SizeConfig.h(38)),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
