import 'package:flutter/widgets.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
class ServiceCardRow extends StatelessWidget {
  const ServiceCardRow({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: const Color(0xff333333)),
          ),

          SizedBox(width: SizeConfig.w(8)),

          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              softWrap: true,
              style: AppTextStyles.styleRegular14(
                context,
              ).copyWith(color: const Color(0xff555555)),
            ),
          ),
        ],
      ),
    );
  }
}
