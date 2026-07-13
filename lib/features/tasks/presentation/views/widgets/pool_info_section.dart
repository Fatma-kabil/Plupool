import 'package:flutter/material.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/domain/entities/pool_profile_entity.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/pool_info_card.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/section_header.dart';

class PoolInfoSection extends StatelessWidget {
  const PoolInfoSection({super.key, required this.pool});

  final PoolProfileEntity pool;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          const SectionHeader(
            icon: Icons.pool_outlined,
            title: "معلومات حمام السباحة",
          ),

          SizedBox(height: SizeConfig.h(16)),

          Row(
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: PoolInfoCard(
                  title: "النوع",
                  value: pool.poolTypeLabel,
                  color: const Color(0xFFCDF7EC),
                  iconcolor: const Color(0xff06D6A0),
                  icon: Icons.pool,
                ),
              ),

              SizedBox(width: SizeConfig.w(8)),

              Expanded(
                child: PoolInfoCard(
                  title: "الأبعاد",
                  value: toArabicNumbers(pool.dimensions),
                  color: const Color(0xFFCCE4F0),
                  iconcolor: const Color(0xff2B8EC2),
                  icon: Icons.straighten,
                ),
              ),

              SizedBox(width: SizeConfig.w(8)),

              Expanded(
                child: PoolInfoCard(
                  title: "الحجم",
                  value: toArabicNumbers(
                    '${pool.volumeLiters.toStringAsFixed(0)} لتر',
                  ),
                  color: const Color(0xFFFFECD2),
                  iconcolor: const Color(0xffFF9F1C),
                  icon: Icons.square_foot,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
