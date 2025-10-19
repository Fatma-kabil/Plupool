
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
      height: SizeConfig.isWideScreen? SizeConfig.w(105) :SizeConfig.h(130),
      padding:  EdgeInsets.only(left: SizeConfig.w(5), right: SizeConfig.w(5), bottom: SizeConfig.h(10), top: SizeConfig.h(10)),
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
              padding:  EdgeInsets.symmetric(horizontal: SizeConfig.w(6),vertical: SizeConfig.w(6)),
              child: SvgPicture.asset(
                image,
                color: imagecolor,
                height:SizeConfig.isWideScreen?SizeConfig.h(22): SizeConfig.w(22),
                width: SizeConfig.w(22),
              ),
            ),
          ),
           SizedBox(height: SizeConfig.h(10)),
          Text(
            title,
            //  textAlign: TextAlign.center,
            style: AppTextStyles.styleBold10(
              context,
            ).copyWith(color: Colors.black),
          ),
           SizedBox(height: SizeConfig.h(4)),
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
