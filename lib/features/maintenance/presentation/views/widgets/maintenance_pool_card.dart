import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';


class MaintenancePoolCard extends StatelessWidget {
  const MaintenancePoolCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        color: AppColors.kScaffoldColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xff80BBDA), width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              
              
       //   Column(
          //  children: pool.features.map((feature) {
           //   return Row(
             //   children: [
                  SvgPicture.asset(
                    'assets/icons/done.svg',
                    height: SizeConfig.h(16),
                    width: SizeConfig.w(16),
                  ),
                  const SizedBox(width: 6),
                 
                ],
          //    );
        //    }).toList(),
      //    ),

               
         //   ],
          ),
        ),
      ),
    );
  }
}