
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        
        color: Colors.white, // var(--White-50, #FFF)
        borderRadius: BorderRadius.circular(23),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25), // rgba(0,0,0,0.25)
            offset: Offset(0, 1), // x=0, y=1
            blurRadius: 2, // نفس 0 1px 2px
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: AppColors.kprimarycolor,
            size: SizeConfig.w(20),
          ),
          onTap: () {
            context.pop(); // go_router back
          },
        ),
      ),
    );
  }
}
