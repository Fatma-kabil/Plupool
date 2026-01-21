import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/date_picker_field.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';
import 'package:plupool/features/store/data/models/product_model.dart';

class EditProductOfferCard extends StatefulWidget {
  const EditProductOfferCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<EditProductOfferCard> createState() => _EditProductOfferCardState();
}

class _EditProductOfferCardState extends State<EditProductOfferCard> {
  late TextEditingController offerController;

  DateTime? startDate;
  DateTime? endDate;

  String? startDateError;
  String? endDateError;
  String? discountError;

  @override
  void initState() {
    super.initState();

    offerController = TextEditingController(
      text: widget.product.discountPercent.toString(),
    );

    startDate = widget.product.startDate;
    endDate = widget.product.endDate;
    
 debugPrint('START DATE: $startDate');
  debugPrint('END DATE: $endDate');
  }


  @override
  void dispose() {
    offerController.dispose();
    super.dispose();
  }

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return "${date.day}/${date.month}/${date.year}";
  }

  void onSubmit() {
    setState(() {
      startDateError = null;
      endDateError = null;
      discountError = null;
    });

    if (startDate == null) {
      setState(() => startDateError = 'اختاري تاريخ البداية');
      return;
    }

    if (endDate == null) {
      setState(() => endDateError = 'اختاري تاريخ النهاية');
      return;
    }

    if (offerController.text.isEmpty) {
      setState(() => discountError = 'قيمة الخصم مطلوبة');
      return;
    }

    final discount = int.tryParse(offerController.text);
    if (discount == null || discount <= 0 || discount > 100) {
      setState(() => discountError = 'أدخلي نسبة خصم صحيحة');
      return;
    }

    /// هنا تبعتي البيانات للـ API أو Cubit
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        insetPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(20),
          vertical: SizeConfig.h(29),
        ),
        child: Container(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// اسم المنتج
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
                            size: SizeConfig.w(18),
                          ),
                          SizedBox(width: SizeConfig.w(6)),
                          Text(
                            "اسم المنتج",
                            style: AppTextStyles.styleBold16(context),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.h(6)),
                      Text(
                        widget.product.name,
                        style: AppTextStyles.styleSemiBold16(context)
                            .copyWith(color: const Color(0xff7B7B7B)),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: SizeConfig.h(28)),

                /// تاريخ البداية
                DatePickerField(
                  text: "تاريخ بدء العرض",
                  dirc: CrossAxisAlignment.start,
                  selectedDate: startDate,
                  dateFormat: formatDate,
                  errorText: startDateError,
                  selectedDateColor: AppColors.ktextcolor,
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

                SizedBox(height: SizeConfig.h(15)),

                /// تاريخ النهاية
                DatePickerField(
                  text: "تاريخ نهاية العرض",
                  dirc: CrossAxisAlignment.start,
                  selectedDate: endDate,
                  dateFormat: formatDate,
                  errorText: endDateError,
                  selectedDateColor: AppColors.ktextcolor,
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

                SizedBox(height: SizeConfig.h(12)),

                /// الخصم
                const FieldLabel('قيمة الخصم'),
                TextFieldWithIcon(
                  controller: offerController,
                  hint: 'أدخل نسبة الخصم',
                  icon: Icons.percent,
        //   errorText: discountError,
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: SizeConfig.h(28)),

                /// الأزرار
                Column(
                  children: [
                    CustomTextBtn(
                      text: "تعديل",
                      onPressed: onSubmit,
                      padding: SizeConfig.isWideScreen?15:9,
                      width: SizeConfig.screenWidth,
                      textStyle: AppTextStyles.styleBold16(context)
                          .copyWith(color: Colors.white),
                      trailing: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: SizeConfig.w(13),
                      ),
                    ),
                  SizedBox( height:   SizeConfig.h(15),),
                    CustomOutlinedBtn(
                      text: 'إلغاء',
                     
                      width: SizeConfig.screenWidth,
                      trailing: Icon(
                        Icons.cancel_outlined,
                        color: AppColors.kprimarycolor,
                        size: SizeConfig.w(15),
                      ),
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
