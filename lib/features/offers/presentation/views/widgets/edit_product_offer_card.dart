import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/date_picker_field.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/offers/presentation/views/widgets/custom_check_btn.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/product_offer_cubit/product_offer_cubit.dart';
import 'package:plupool/features/offers/domain/enities/product_offer_entity.dart';
import 'package:plupool/features/products/domain/entities/product_entity.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';

class EditProductOfferCard extends StatefulWidget {
  const EditProductOfferCard({super.key, required this.product});

  final Product product;

  @override
  State<EditProductOfferCard> createState() => _EditProductOfferCardState();
}

class _EditProductOfferCardState extends State<EditProductOfferCard> {
  late TextEditingController offerController;

  DateTime? startDate;
  DateTime? endDate;
  late bool acceptedTerms;
  String? startDateError;
  String? endDateError;
  String? discountError;

  @override
  void initState() {
    super.initState();

    offerController = TextEditingController(
      text: widget.product.discountValue?.toString() ?? "",
    );

    startDate = widget.product.offerStartDate;
    endDate = widget.product.offerEndDate;
    acceptedTerms = widget.product.isFeatured!;
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

    final discount = double.tryParse(offerController.text);
    if (discount == null || discount <= 0 || discount > 100) {
      setState(() => discountError = 'أدخلي نسبة خصم صحيحة');
      return;
    }

    context.read<ProductOfferCubit>().updateOffer(
      ProductOfferEntity(
        id: widget.product.id!,
        discountType: "percentage",
        discountValue: discount,
        offerBadge: "عرض خاص",
        offerStartDate: startDate!,
        offerEndDate: endDate!,
        isFeatured: acceptedTerms 
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return BlocListener<ProductOfferCubit, ProductOfferState>(
      listener: (context, state) {
        if (state is ProductOfferSuccess) {
          context.read<ProductOfferCubit>().getOffers();
          Navigator.pop(context);

          showCustomSnackBar(
            context: context,
            message: "تم تعديل العرض بنجاح",
            isSuccess: true,
          );
        }

        if (state is EditProductOfferError) {
        context.read<ProductOfferCubit>().getOffers();
          showCustomSnackBar(context: context, message: state.message);
        }
      },
      child: BlocBuilder<ProductOfferCubit, ProductOfferState>(
        builder: (context, state) {
          final isLoading = state is ProductOfferLoading;

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
                      /// (كل UI بتاعك زي ما هو 👇)
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

                      const FieldLabel('قيمة الخصم'),

                      TextFieldWithIcon(
                        controller: offerController,
                        hint: 'أدخل نسبة الخصم',
                        icon: Icons.percent,
                        keyboardType: TextInputType.number,
                      ),

                     SizedBox(height: SizeConfig.h(20)),
    
                  CustomCheckbtn(
                    value: acceptedTerms,
                    onChanged: (val) => setState(() => acceptedTerms = val),
                    label: "عرض مميز (يظهر في الصفحة الرئيسية)",
                  ),
    
                  SizedBox(height: SizeConfig.h(28)),
                      /// 👇 BUTTONS (المهم هنا)
                      Column(
                        children: [
                          CustomTextBtn(
                            text: isLoading ? "جاري التعديل..." : "تعديل",
                            onPressed: isLoading ? null : onSubmit,
                            padding: SizeConfig.isWideScreen ? 15 : 9,
                            width: SizeConfig.screenWidth,
                            textStyle: AppTextStyles.styleBold16(
                              context,
                            ).copyWith(color: Colors.white),
                            trailing: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: SizeConfig.w(13),
                            ),
                          ),

                          SizedBox(height: SizeConfig.h(15)),

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
        },
      ),
    );
  }
}
