import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
      
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.isWideScreen ? SizeConfig.w(30) : SizeConfig.w(15),
      ),
      child: Row(
        children:  [
          Expanded(child: Divider(thickness: 1)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text("أو",style: AppTextStyles.styleMedium20(context).copyWith(color: Colors.black,fontSize: SizeConfig.isWideScreen?26:null),),
          ),
          Expanded(child: Divider(thickness: 1)),
        ],
      ),
    );
  }
}
