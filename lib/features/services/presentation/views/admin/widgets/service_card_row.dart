import 'package:flutter/widgets.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class ServiceCardRow extends StatelessWidget {
  const ServiceCardRow({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: SizeConfig.w(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.styleSemiBold15(context).copyWith(color:Color(0xff333333))),
          Text(value, style: AppTextStyles.styleRegular16(context).copyWith(color:Color(0xff555555)),)
        ],
      ),
    );
  }
}
