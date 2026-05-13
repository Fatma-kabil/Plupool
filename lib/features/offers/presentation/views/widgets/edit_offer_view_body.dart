import 'dart:io';

import 'package:flutter/material.dart' hide TextField;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/date_picker_field.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/auth/presentation/views/widgets/profile_image_picker.dart';
import 'package:plupool/features/offers/domain/enities/offer_entity.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/offer_cubit/offer_cubit.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/offer_cubit/offer_state.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/offers/presentation/views/widgets/custom_check_btn.dart';
import 'package:plupool/features/offers/presentation/views/widgets/description_input.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';

class EditOfferViewBody extends StatefulWidget {
  const EditOfferViewBody({
    super.key,
    required this.offer,
  });

  final OfferEntity offer;

  @override
  State<EditOfferViewBody> createState() => _EditOfferViewBodyState();
}

class _EditOfferViewBodyState extends State<EditOfferViewBody> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController titleController;
  late final TextEditingController offerController;
  late final TextEditingController desController;

  File? _profileImage;

  DateTime? startDate;
  DateTime? endDate;

  String? startDateError;
  String? endDateError;

  bool acceptedTerms = false;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(
      text: widget.offer.title,
    );

    offerController = TextEditingController(
      text: widget.offer.discountValue.toString(),
    );

    desController = TextEditingController(
      text: widget.offer.description,
    );

    startDate = widget.offer.startDate;
    endDate = widget.offer.endDate;

    acceptedTerms = widget.offer.isFeatured;
  }

  @override
  void dispose() {
    titleController.dispose();
    offerController.dispose();
    desController.dispose();
    super.dispose();
  }

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return "${date.day}/${date.month}/${date.year}";
  }

  void submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    if (startDate == null) {
      setState(() => startDateError = "اختار تاريخ البداية");
      return;
    }

    if (endDate == null) {
      setState(() => endDateError = "اختار تاريخ النهاية");
      return;
    }

    final updatedOffer = OfferEntity(
      id: widget.offer.id,

      title: titleController.text,

      description: desController.text,

      startDate: startDate!,

      endDate: endDate!,

      discountValue: num.parse(
        offerController.text,
      ),

      imageUrl: widget.offer.imageUrl,

      image: _profileImage,

      isFeatured: acceptedTerms,
    );

    context.read<OfferCubit>().updateOffer(
          updatedOffer,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OfferCubit, OfferState>(
      listener: (context, state) {
        if (state is OfferSuccess) {
          Navigator.pop(context);

          showCustomSnackBar(
            context: context,
            message: state.message,
            isSuccess: true,
          );
        }

        if (state is UpdateOfferError) {
          showCustomSnackBar(
            context: context,
            message: state.message,
          );
        }
      },

      builder: (context, state) {
        final isLoading = state is OfferLoading;

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(8),
            ),

            child: Form(
              key: _formKey,

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  /// ================= TITLE =================
                  const FieldLabel('عنوان العرض'),

                  TextField(
                    controller: titleController,

                    hint: 'أكتب عنوان العرض....',

                    validator: (value) =>
                        Validators.required(
                      value,
                      fieldName: "عنوان العرض",
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// ================= DISCOUNT =================
                  const FieldLabel('قيمة الخصم'),

                  TextField(
                    controller: offerController,

                    hint: 'أكتب قيمة الخصم....',

                    keyboardType:
                        TextInputType.number,

                    validator: (value) =>
                        Validators.required(
                      value,
                      fieldName: "قيمة الخصم",
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// ================= START DATE =================
                  DatePickerField(
                    dirc: CrossAxisAlignment.start,

                    text: "تاريخ بدء العرض",

                    selectedDateColor:
                        AppColors.ktextcolor,

                    selectedDate: startDate,

                    dateFormat: formatDate,

                    errorText: startDateError,

                    onTap: () async {
                      final picked =
                          await pickDateFun(context);

                      if (picked != null) {
                        setState(() {
                          startDate = picked;
                          startDateError = null;
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 20),

                  /// ================= END DATE =================
                  DatePickerField(
                    dirc: CrossAxisAlignment.start,

                    text: "تاريخ نهاية العرض",

                    selectedDateColor:
                        AppColors.ktextcolor,

                    selectedDate: endDate,

                    dateFormat: formatDate,

                    errorText: endDateError,

                    onTap: () async {
                      final picked =
                          await pickDateFun(context);

                      if (picked != null) {
                        setState(() {
                          endDate = picked;
                          endDateError = null;
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 20),

                  /// ================= DESCRIPTION =================
                  const FieldLabel('وصف العرض'),

                  DescriptionInputContainer(
                    controller: desController,

                    validator: (value) =>
                        Validators.required(
                      value,
                      fieldName: "وصف العرض",
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// ================= IMAGE PICKER =================
                  const FieldLabel('صور العرض'),

                  ProfileImagePicker(
                    backgroundColor:
                        const Color(
                          0xffCDCDCD,
                        ).withAlpha(70),

                    title: "أضف صورة للعرض",

                    isCircle: false,

                    icon: Icons
                        .add_photo_alternate_outlined,

                    onImagePicked: (img) {
                      _profileImage = img;
                    },
                  ),

                  const SizedBox(height: 15),

                  /// ================= CURRENT IMAGE =================
                  if (_profileImage != null)
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(12),

                      child: Image.file(
                        _profileImage!,

                        height: SizeConfig.h(90),

                        width: SizeConfig.w(80),

                        fit: BoxFit.cover,
                      ),
                    )

                  else if (widget
                      .offer.imageUrl.isNotEmpty)
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(12),

                      child: Image.network(
                        widget.offer.imageUrl,

                        height: SizeConfig.h(90),

                        width: SizeConfig.w(80),

                        fit: BoxFit.cover,

                        errorBuilder:
                            (_, __, ___) {
                          return Container(
                            height:
                                SizeConfig.h(90),

                            width:
                                SizeConfig.w(80),

                            color:
                                Colors.grey.shade300,

                            child: const Icon(
                              Icons.broken_image,
                            ),
                          );
                        },
                      ),
                    ),

                  const SizedBox(height: 15),

                  /// ================= FEATURED =================
                  CustomCheckbtn(
                    value: acceptedTerms,

                    onChanged: (val) {
                      setState(() {
                        acceptedTerms = val;
                      });
                    },

                    label: "عرض مميز",
                  ),

                  const SizedBox(height: 40),

                  /// ================= BUTTON =================
                  AddEditOfferViewFooter(
                    text: isLoading
                        ? "جاري التعديل..."
                        : "تعديل",

                    onPressed: isLoading
                        ? null
                        : () => submit(context),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}