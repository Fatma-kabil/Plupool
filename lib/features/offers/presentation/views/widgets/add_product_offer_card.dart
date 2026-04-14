import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/date_picker_field.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/offers/domain/enities/product_offer_entity.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/offer_cubit/product_offer_cubit.dart';
import 'package:plupool/features/offers/presentation/views/widgets/custom_check_btn.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';

class AddProductOfferCard extends StatefulWidget {
  const AddProductOfferCard({
    super.key,
    required this.productName,
    required this.productId,
  });

  final String productName;
  final int productId;

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
    SizeConfig.init(context);

    return BlocProvider(
      create: (_) => sl<ProductOfferCubit>(),
      child: BlocListener<ProductOfferCubit, ProductOfferState>(
        listener: (context, state) {
          if (state is ProductOfferSuccess) {
            Navigator.pop(context);
            showCustomSnackBar(
              context: context,
              message: "تم إضافة العرض بنجاح",
              isSuccess: true,
            );
          }

          if (state is ProductOfferError) {
            showCustomSnackBar(context: context, message: state.message);
          }
        },
        child: Directionality(
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
              width: SizeConfig.isWideScreen
                  ? SizeConfig.screenWidth * 0.8
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

                    SizedBox(height: SizeConfig.h(28)),

                    /// start date
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

                    SizedBox(height: SizeConfig.h(15)),

                    /// end date
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

                    SizedBox(height: SizeConfig.h(12)),

                    const FieldLabel(' قيمة الخصم'),

                    TextFieldWithIcon(
                      controller: offerController,
                      hint: 'أدخل قيمة الخصم',
                      icon: Icons.percent,
                    ),

                    SizedBox(height: SizeConfig.h(20)),

                    CustomCheckbtn(
                      value: acceptedTerms,
                      onChanged: (val) => setState(() => acceptedTerms = val),
                      label: "عرض مميز (يظهر في الصفحة الرئيسية)",
                    ),

                    SizedBox(height: SizeConfig.h(28)),

                    /// buttons
                    BlocBuilder<ProductOfferCubit, ProductOfferState>(
                      builder: (context, state) {
                        final isLoading = state is ProductOfferLoading;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextBtn(
                              text: isLoading ? " ..." : "إضافة",
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      /// validation
                                      if (startDate == null) {
                                        setState(
                                          () => startDateError =
                                              "اختر تاريخ البداية",
                                        );
                                        return;
                                      }

                                      if (endDate == null) {
                                        setState(
                                          () => endDateError =
                                              "اختر تاريخ النهاية",
                                        );
                                        return;
                                      }

                                      if (endDate!.isBefore(startDate!)) {
                                        showCustomSnackBar(
                                          context: context,
                                          message:
                                              "تاريخ النهاية لازم يكون بعد البداية",
                                        );
                                        return;
                                      }

                                      if (offerController.text.isEmpty) {
                                        showCustomSnackBar(
                                          context: context,
                                          message: "أدخل قيمة الخصم",
                                        );
                                        return;
                                      }
                                      final text = normalizeArabicNumbers(
                                        offerController.text.trim(),
                                      );
                                      final discount = double.tryParse(text);

                                      if (discount == null || discount <= 0) {
                                        showCustomSnackBar(
                                          context: context,
                                          message: "ادخل قيمة خصم صحيحة",
                                        );
                                        return;
                                      }

                                      context
                                          .read<ProductOfferCubit>()
                                          .addOffer(
                                            ProductOfferEntity(
                                              id: widget.productId,
                                              discountType: "percentage",
                                              discountValue: double.tryParse(
                                                offerController.text,
                                              )!,
                                              offerBadge: "عرض خاص",
                                              offerStartDate: startDate!,
                                              offerEndDate: endDate!,
                                              isFeatured: acceptedTerms,
                                            ),
                                          );
                                    },
                              padding: SizeConfig.isWideScreen ? 12 : 7,
                              width: SizeConfig.w(120),
                              textStyle: AppTextStyles.styleBold16(
                                context,
                              ).copyWith(color: Colors.white),
                              trailing: const Icon(
                                Icons.local_offer_rounded,
                                color: Colors.white,
                              ),
                            ),

                            CustomOutlinedBtn(
                              text: 'إلغاء',
                              trailing: Icon(
                                Icons.cancel_outlined,
                                color: AppColors.kprimarycolor,
                              ),
                              width: SizeConfig.w(120),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
