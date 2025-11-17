import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:intl/intl.dart' as intl;
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/views/widgets/time_date_row.dart';

class OrderSummaryViewBody extends StatelessWidget {
  OrderSummaryViewBody({super.key});
  final date = DateTime(2025, 10, 22, 11, 00);
  @override
  Widget build(BuildContext context) {
    final formattedDate = intl.DateFormat(
      'yyyy/MM/dd – hh:mm a',
    ).format(date).replaceAll('AM', 'ص').replaceAll('PM', 'م');
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          Text(
            "ملخص الطلب رقم #12345",
            textDirection: TextDirection.rtl,
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
          SizedBox(height: SizeConfig.h(4)),
          TimeDateRow(formattedDate: formattedDate),
          SizedBox(height: SizeConfig.h(8)),
          Container(
            margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(15),
              vertical: SizeConfig.h(15),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.textFieldBorderColor),
            ),
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "عدد المنتجات : 6 ",
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: Color(0xff555555)),
                ),
                SizedBox(height: SizeConfig.h(8)),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      "الإجمالي",
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.styleRegular16(
                        context,
                      ).copyWith(color: Color(0xff555555)),
                    ),
                    Spacer(),
                    Text(
                      "9000 EGP",
                      // textDirection: TextDirection.rtl,
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: Color(0xff555555)),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.h(8)),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      "رسوم التوصيل",
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.styleRegular16(
                        context,
                      ).copyWith(color: Color(0xff555555)),
                    ),
                    Spacer(),
                    Text(
                      "50 EGP",
                      //  textDirection: TextDirection.rtl,
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: Color(0xff555555)),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.h(4)),
                Divider(color: AppColors.textFieldBorderColor),
                // SizedBox(height: SizeConfig.h(4)),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.h(4),
                    horizontal: SizeConfig.w(55),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "9050 EGP",
                        //textDirection: TextDirection.rtl,
                        style: AppTextStyles.styleBold16(
                          context,
                        ).copyWith(color: Color(0xff333333)),
                      ),
                      Spacer(),
                      Text(
                        " الإجمالي الكلي  :  ",
                        textDirection: TextDirection.rtl,
                        style: AppTextStyles.styleRegular16(
                          context,
                        ).copyWith(color: Color(0xff555555)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.h(15)),
          Container(
            margin: EdgeInsets.only(bottom: SizeConfig.h(15)),
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(15),
              vertical: SizeConfig.h(15),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffCCE4F0),
            ),
            child: Column(
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      "العنوان ورقم الهاتف",

                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: Color(0xff333333)),
                    ),
                    Spacer(),
                    Text(
                      "تعديل",

                      style: AppTextStyles.styleSemiBold15(context),
                    ),
                    SizedBox(width: SizeConfig.w(4)),
                    Icon(
                      Icons.edit_note,
                      color: AppColors.kprimarycolor,
                      size: SizeConfig.w(20),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.h(6)),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Color(0xffBBBBBB),
                      size: SizeConfig.w(17),
                    ),
                    SizedBox(width: SizeConfig.w(2)),
                    Text(
                      "شارع الجمهورية، الدور الثالث، شقة 12، القاهرة",

                      style: AppTextStyles.styleRegular13(
                        context,
                      ).copyWith(color: Color(0xff777777)),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.h(4)),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      Icons.phone_rounded,
                      color: Color(0xffBBBBBB),
                      size: SizeConfig.w(17),
                    ),
                    SizedBox(width: SizeConfig.w(2)),
                    Text(
                      "+20 123 456 7890",

                      style: AppTextStyles.styleRegular13(
                        context,
                      ).copyWith(color: Color(0xff777777)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.h(15)),
          Container(
            margin: EdgeInsets.only(bottom: SizeConfig.h(15)),
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(15),
              vertical: SizeConfig.h(15),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffCDF7EC),
            ),
            child: Column(
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      "طريقة الدفع",

                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: Color(0xff333333)),
                    ),

                    SizedBox(width: SizeConfig.w(4)),
                    Icon(
                      Icons.payments_outlined,
                      color: Color(0xff05B285),
                      size: SizeConfig.w(20),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.h(8)),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Color(0xff05B285),
                      size: SizeConfig.w(17),
                    ),
                    SizedBox(width: SizeConfig.w(4)),
                    Text(
                      "الدفع عند الاستلام",

                      style: AppTextStyles.styleRegular13(
                        context,
                      ).copyWith(color: Color(0xff777777)),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.h(6)),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color:  Color(0xff05B285),
                      size: SizeConfig.w(17),
                    ),
                    SizedBox(width: SizeConfig.w(4)),
                    Text(
                      " سيتم الدفع نقدًا عند استلام الطلب من المندوب",

                      style: AppTextStyles.styleRegular13(
                        context,
                      ).copyWith(color: Color(0xff777777)),
                    ),
                  ],
                ),
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}
