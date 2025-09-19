import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomerHomeView extends StatelessWidget {
  const CustomerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 12,left: 17,right: 17),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                
                children: [
                  CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/images/app_icon.png',
                      height: SizeConfig.h(32),
                      width: SizeConfig.w(32),
                    ),
                  ),
                  Text('أهلا ساره',style: AppTextStyles.styleSemiBold16(context),)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
