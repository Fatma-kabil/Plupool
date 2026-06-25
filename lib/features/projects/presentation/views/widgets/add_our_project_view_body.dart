import 'dart:io';

import 'package:flutter/material.dart' hide TextField;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/auth/presentation/views/widgets/profile_image_picker.dart';
import 'package:plupool/features/offers/presentation/views/widgets/custom_check_btn.dart';
import 'package:plupool/features/offers/presentation/views/widgets/description_input.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';
import 'package:plupool/features/projects/data/models/update_project_model.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_cubit.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_state.dart';

class AddOurProjectViewBody extends StatefulWidget {
  const AddOurProjectViewBody({super.key});

  @override
  State<AddOurProjectViewBody> createState() => _AddOurProjectViewBodyState();
}

class _AddOurProjectViewBodyState extends State<AddOurProjectViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController partnerController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController desController = TextEditingController();

  bool acceptedTerms = false;

  File? beforeImage;
  File? afterImage;

  @override
  void dispose() {
    titleController.dispose();
    partnerController.dispose();
    durationController.dispose();
    locationController.dispose();
    desController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OurProjectsCubit, OurProjectsState>(
      listener: (context, state) {
        if (!state.isUpdating && state.error == null) {
          showCustomSnackBar(
            context: context,
            message: "تم إضافة المنتج بنجاح",
            isSuccess: true,
          );
          Future.delayed(const Duration(milliseconds: 300), () {
            Navigator.pop(context);
          });
        }

        if (state.error != null) {
          showCustomSnackBar(
            context: context,
            message: state.error!,
            isSuccess: false,
          );
        }
      },
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🟡 اسم المنتج
                    const FieldLabel('عنوان المشروع'),
                    TextField(
                      controller: titleController,
                      keyboardType: TextInputType.text,
                      validator: (value) =>
                          value == null || value.isEmpty ? "مطلوب" : null,
                      hint: 'اكتب عنوان المشروع...',
                    ),

                    const SizedBox(height: 16),

                    /// 🟡 السعر
                    const FieldLabel('الشركه الشريكه'),
                    TextFieldWithIcon(
                      controller: partnerController,
                      hint: 'أكتب اسم الشركة....',
                      icon: Icons.business,
                    ),

                    const SizedBox(height: 16),

                    /// 🟡 الكمية
                    const FieldLabel('مدة التنفيذ'),
                    TextFieldWithIcon(
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value == null || value.isEmpty ? "مطلوب" : null,
                      controller: durationController,
                      hint: 'أكتب مدة التنفيذ....',
                      icon: Icons.timer,
                    ),

                    const SizedBox(height: 16),

                    /// 🟡 التصنيف (Dynamic from API)
                   
                    const FieldLabel('الموقع'),
                    TextFieldWithIcon(
                      controller: locationController,
                      hint: 'أكتب موقع المشروع....',
                      icon: Icons.location_on,
                      validator: (value) =>
                          value == null || value.isEmpty ? "مطلوب" : null,
                    ),
                    const SizedBox(height: 16),
                    const FieldLabel('وصف العرض'),
                    DescriptionInputContainer(
                      controller: desController,
                      validator: (value) =>
                          value == null || value.isEmpty ? "مطلوب" : null,
                    ),
                    const SizedBox(height: 16),
                    //   const SizedBox(height: 20),

                    /// 🟡 صورة المنتج
                    const FieldLabel('صورة المشروع (قبل)'),
                    ProfileImagePicker(
                      backgroundColor: const Color(0xffCDCDCD).withAlpha(70),
                      title: "أضف صورة للمنتج",
                      isCircle: false,
                      icon: Icons.add_photo_alternate_outlined,
                      onImagePicked: (img) {
                        setState(() => beforeImage = img);
                      },
                    ),
                    const SizedBox(height: 16),
                    //   const SizedBox(height: 20),

                    /// 🟡 صورة المنتج
                    const FieldLabel('صورة المشروع (قبل)'),
                    ProfileImagePicker(
                      backgroundColor: const Color(0xffCDCDCD).withAlpha(70),
                      title: "أضف صورة للمنتج",
                      isCircle: false,
                      icon: Icons.add_photo_alternate_outlined,
                      onImagePicked: (img) {
                        setState(() => afterImage = img);
                      },
                    ),
                    const SizedBox(height: 15),

                    CustomCheckbtn(
                      value: acceptedTerms,
                      onChanged: (val) => setState(() => acceptedTerms = val),
                      label: "عرض مميز (يظهر في الصفحة الرئيسية)",
                    ),

                    const SizedBox(height: 40),

                    /// 🟡 زرار الإضافة
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextBtn(
                text: context.watch<OurProjectsCubit>().state.isUpdating
                    ? "جاري ..."
                    : "إضافة",
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;

                  if (beforeImage == null || afterImage == null) {
                    showCustomSnackBar(
                      context: context,
                      message: "يجب اختيار صورتي قبل وبعد",
                      isSuccess: false,
                    );
                    return;
                  }

                  context.read<OurProjectsCubit>().addProject(
                    UpdateProjectRequest(
                      projectType: "pool_construction",
                      nameAr: titleController.text,
                      companyPartner: partnerController.text,
                      durationWeeks: int.tryParse(durationController.text),
                      locationAr: locationController.text,
                      descriptionAr: desController.text,
                      isHomeFeatured: acceptedTerms ? 1 : 0,
                      image_1: beforeImage,
                      image2File: afterImage,
                      isCompanyProject: 0
                    
                    ),
                  );
                },
                padding: SizeConfig.isWideScreen ? 12 : 7,
                width: SizeConfig.w(120),
                textStyle: AppTextStyles.styleBold16(
                  context,
                ).copyWith(color: Colors.white),
                trailing: const Icon(Icons.edit_note, color: Colors.white),
              ),

              CustomOutlinedBtn(
                text: 'إلغاء',
                onPressed: () => Navigator.pop(context),
                trailing: Icon(
                  Icons.cancel_outlined,
                  color: AppColors.kprimarycolor,
                  size: SizeConfig.w(15),
                ),
                width: SizeConfig.w(120),
              ),
            ],
          ),
          //  const SizedBox(height: 30),
        ],
      ),
    );
  }
}
