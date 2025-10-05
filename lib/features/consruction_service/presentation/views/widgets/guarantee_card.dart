
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class GuaranteeCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final Color backgroundColor;
  final Color imagecolor;

  const GuaranteeCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.backgroundColor,
    required this.imagecolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.h(122),
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: backgroundColor,
              border: Border.all(color: imagecolor),
            ),
            // radius: 17,
            //   backgroundColor: backgroundColor,),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                image,
                color: imagecolor,
                height: SizeConfig.h(24),
                width: SizeConfig.w(25),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            //  textAlign: TextAlign.center,
            style: AppTextStyles.styleBold10(
              context,
            ).copyWith(color: Colors.black),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            style: AppTextStyles.styleRegular10(
              context,
            ).copyWith(color: Color(0xff777777)),
          ),
        ],
      ),
    );
  }
}
