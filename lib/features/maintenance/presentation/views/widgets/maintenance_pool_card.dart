import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/maintenance/presentation/data/models/maintenance_pool_model.dart';

class MaintenancePoolCard extends StatelessWidget {
  const MaintenancePoolCard({super.key, required this.maintenancePool});

  final MaintenancePoolModel maintenancePool;

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
          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.w(10),vertical:SizeConfig.h(10) ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20), // نفس درجة كاردك
                child: Image.asset(
                  maintenancePool.imageUrl,
                  height:SizeConfig.isWideScreen? SizeConfig.w(170):SizeConfig.h(186),
                  width:double.infinity,
                //  width: SizeConfig.w(340),
                  fit: BoxFit.cover, // علشان الصورة تملأ المساحة بشكل جميل
                ),
              ),
              SizedBox(height:SizeConfig.h(8) ,),
              Text(
              
                maintenancePool.title,
                style: AppTextStyles.styleBold16(
                  context,
                ).copyWith(color: AppColors.kprimarycolor),
              ),
                SizedBox(height: 5,),
              Column(
                children: maintenancePool.features.map((feature) {
                  return Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/done.svg',
                        height: SizeConfig.h(16),
                        width: SizeConfig.w(16),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          feature,
                          style: AppTextStyles.styleRegular16(
                            context,
                          ).copyWith(color: Color(0xff777777)),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
