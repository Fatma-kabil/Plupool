import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/date_picker_field.dart';
import 'package:plupool/features/offers/presentation/views/widgets/custom_check_btn.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';

class AddProductOfferCard extends StatefulWidget {
  const AddProductOfferCard({super.key, required this.productName});
  final String productName;

  @override
  State<AddProductOfferCard> createState() => _AddProductOfferCardState();
}

class _AddProductOfferCardState extends State<AddProductOfferCard> {
  DateTime? startDate;
  DateTime? endDate;
  String? startDateError;
  String? endDateError;
  bool acceptedTerms = false;
  final offerController = TextEditingController();

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  void dispose() {
    offerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(20),
          vertical: SizeConfig.h(29),
        ),
        child: Container(
          width: SizeConfig.isWideScreen
              ? SizeConfig.screenWidth * 0.65
              : double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(16),
            vertical: SizeConfig.h(20),
          ),
          decoration: BoxDecoration(
            color: AppColors.kScaffoldColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.w(12),
                    vertical: SizeConfig.h(8),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffCCE4F0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.inventory_2_outlined,
                            color: const Color(0xff2B8EC2),
                            size: SizeConfig.w(20),
                          ),
                          SizedBox(width: SizeConfig.w(6)),
                          Text(
                            "اسم المنتج",
                            style: AppTextStyles.styleBold16(
                              context,
                            ).copyWith(color: AppColors.ktextcolor),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.h(6)),
                      Text(
                        widget.productName,
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: const Color(0xff7B7B7B)),
                      ),
                    ],
                  ),
                ),
                DatePickerField(
                  dirc: CrossAxisAlignment.start,
                  text: "تاريخ بدء العرض",
                  selectedDateColor: AppColors.ktextcolor,
                  selectedDate: startDate,
                  dateFormat: formatDate,
                  errorText: startDateError,
                  onTap: () async {
                    final picked = await pickDateFun(context);
                    if (picked != null) {
                      setState(() {
                        startDate = picked;
                        startDateError = null;
                      });
                    }
                  },
                ),
                const SizedBox(height: 20),

                DatePickerField(
                  dirc: CrossAxisAlignment.start,
                  text: "تاريخ نهاية العرض",
                  selectedDateColor: AppColors.ktextcolor,
                  selectedDate: endDate,
                  dateFormat: formatDate,
                  errorText: endDateError,
                  onTap: () async {
                    final picked = await pickDateFun(context);
                    if (picked != null) {
                      setState(() {
                        endDate = picked;
                        endDateError = null;
                      });
                    }
                  },
                ),
                const SizedBox(height: 20),
                const FieldLabel(' قيمة الخصم'),
                TextFieldWithIcon(
                  controller: offerController,
                  hint: 'أدخل قيمة الخصم',
                  icon: Icons.percent,
                ),
                const SizedBox(height: 15),
                CustomCheckbtn(
                  value: acceptedTerms,
                  onChanged: (val) => setState(() => acceptedTerms = val),
                  label: "عرض مميز (يظهر في الصفحة الرئيسية)",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextBtn(
                      text: "إضافة العرض",
                      onPressed: () {},
                      width: SizeConfig.w(140),
                      trailing: Icon(
                        Icons.local_offer_rounded,
                        color: Colors.white,
                        size: SizeConfig.w(20),
                      ),
                    ),

                    CustomOutlinedBtn(
                      text: 'إلغاء',
                      trailing: Icon(
                        Icons.cancel_outlined,
                        color: AppColors.kprimarycolor,
                        size: SizeConfig.w(20),
                      ),
                      width: SizeConfig.w(140),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
