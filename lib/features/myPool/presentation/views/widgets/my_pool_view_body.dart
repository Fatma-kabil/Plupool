import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/content_card.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/pool_info_row.dart';

class MyPoolViewBody extends StatelessWidget {
  const MyPoolViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: SizeConfig.h(378),
                child: Image.asset(
                  'assets/images/pool_background.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),

              Positioned(
                top: SizeConfig.h(170),
                left: SizeConfig.w(15),
                right: SizeConfig.w(15),
                child: PoolInfoRow(),
              ),

              // مجرد شكل كارد علشان يعمل الـ overlap لكن من غير محتوى
              Positioned(
                top: SizeConfig.h(290),
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  //    height: SizeConfig.h(150),
                  decoration: BoxDecoration(
                    color: AppColors.kScaffoldColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: SizeConfig.w(18),
                      top: SizeConfig.h(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title + small subtitle
                        Text(
                          'مرحبًا بك في Your Pool',
                          style: AppTextStyles.styleBold16(
                            context,
                          ).copyWith(color: AppColors.ktextcolor),
                        ),
                        SizedBox(height: SizeConfig.h(6)),
                        Text(
                          'تابع صيانة حمامك بكل سهولة',
                          style: AppTextStyles.styleRegular16(
                            context,
                          ).copyWith(color: Color(0xff777777)),
                        ),
                        SizedBox(height: SizeConfig.h(20)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // الكارد الحقيقي الكامل بعد الستاك
          // الكارد الحقيقي الكامل بعد الستاك
          DefaultTabController(length: 2, child: ContentCard()),
        ],
      ),
    );
  }
}
