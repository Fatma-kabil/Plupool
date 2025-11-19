import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustumSearchTextField extends StatelessWidget {
  const CustumSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(SizeConfig.w(4)), // مساحة حول البوكس للشادو
      decoration: BoxDecoration(
        color: AppColors.kScaffoldColor, // لون خلفية الحقل
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 0,
            spreadRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: TextField(
        textDirection: TextDirection.rtl, // عشان النص والايقونة تكون من اليمين
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'بحث',
          hintStyle: AppTextStyles.styleSemiBold16(context).copyWith(
            color: const Color(0xff777777),
          ),

          // الأيقونة على اليمين (prefixIcon في RTL تكون على اليمين)
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: SizeConfig.w(8)),
            child: Icon(
              Icons.search,
              color: const Color(0xffAAAAAA),
              size: SizeConfig.w(20),
            ),
          ),

          // التحكم في أبعاد الأيقونة عشان تظهر صح
          suffixIconConstraints: BoxConstraints(
            minWidth: SizeConfig.w(35),
            minHeight: SizeConfig.h(35),
          ),

          contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.h(14),
            horizontal: SizeConfig.w(12),
          ),
        ),
      ),
    );
  }
}
