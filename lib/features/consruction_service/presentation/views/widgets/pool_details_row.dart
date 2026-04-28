import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/services/domain/entities/service_request_entity.dart';

class PoolDetailsRow extends StatelessWidget {
  const PoolDetailsRow({super.key, required this.model});
  final ServiceRequestEntity model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              'عرض المسبح',
              style: AppTextStyles.styleMedium14(
                context,
              ).copyWith(color: const Color(0xff555555)),
            ),
            SizedBox(height: SizeConfig.h(5)),
            Text(
              toArabicNumbers(model.poolDimensions.width.toString()),
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: const Color(0xff2B2B2B)),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.h(40),
          child: const VerticalDivider(color: Colors.grey, thickness: 1),
        ),
        Column(
          children: [
            Text(
              'ارتفاع المسبح',
              style: AppTextStyles.styleMedium14(
                context,
              ).copyWith(color: const Color(0xff555555)),
            ),
            SizedBox(height: SizeConfig.h(5)),
            Text(
              toArabicNumbers(model.poolDimensions.depth.toString()),
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: const Color(0xff2B2B2B)),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.h(40),
          child: const VerticalDivider(color: Colors.grey, thickness: 1),
        ),
        Column(
          children: [
            Text(
              'طول المسبح',
              style: AppTextStyles.styleMedium14(
                context,
              ).copyWith(color: const Color(0xff555555)),
            ),
            SizedBox(height: SizeConfig.h(5)),
            Text(
              toArabicNumbers(model.poolDimensions.length.toString()),
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: const Color(0xff2B2B2B)),
            ),
          ],
        ),
      ],
    );
  }
}
