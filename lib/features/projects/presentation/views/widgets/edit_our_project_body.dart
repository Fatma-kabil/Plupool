import 'dart:io';

import 'package:flutter/material.dart' hide TextField;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
import 'package:plupool/features/projects/domain/entities/our_project_entity.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_cubit.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_state.dart';
import 'package:plupool/features/projects/data/models/update_project_model.dart';

class EditOurProjectBody extends StatefulWidget {
  const EditOurProjectBody({super.key, required this.project});
  final OurProjectEntity project;

  @override
  State<EditOurProjectBody> createState() => _EditOurProjectBodyState();
}

class _EditOurProjectBodyState extends State<EditOurProjectBody> {
  late final TextEditingController titleController;
  late final TextEditingController partnerController;
  late final TextEditingController durationController;
  late final TextEditingController locationController;
  late final TextEditingController desController;
  final _formKey = GlobalKey<FormState>();

  late bool acceptedTerms;

  File? beforeImage;
  File? afterImage;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.project.nameAr ?? '');

    partnerController = TextEditingController(
      text: widget.project.companyPartner ?? '',
    );

    durationController = TextEditingController(
      text: widget.project.durationWeeks?.toString(),
    );

    locationController = TextEditingController(
      text: widget.project.locationAr ?? '',
    );

    desController = TextEditingController(
      text: widget.project.descriptionAr ?? '',
    );

    acceptedTerms = (widget.project.isHomeFeatured ?? 0) == 1;
  }

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
      listenWhen: (previous, current) {
        return previous.updateSuccess != current.updateSuccess;
      },
      listener: (context, state) {
        if (state.updateSuccess) {
          showCustomSnackBar(
            context: context,
            message: "تم تحديث المشروع بنجاح",
            isSuccess: true,
          );

          if (context.canPop()) {
            context.pop();
          }
        }
        if (state.error != null) {
          showCustomSnackBar(
            context: context,
            message: state.error!,
            isSuccess: false,
          );
        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FieldLabel('عنوان المشروع'),
              TextField(
                controller: titleController,
                hint: 'أكتب عنوان المشروع....',
                 validator: (value) =>
                          value == null || value.isEmpty ? "مطلوب" : null,
              ),

              const SizedBox(height: 20),

              const FieldLabel('الشركة الشريكة'),
              TextFieldWithIcon(
                controller: partnerController,
                hint: 'أكتب اسم الشركة....',
                icon: Icons.business,
              ),

              const SizedBox(height: 20),

              const FieldLabel('مدة التنفيذ'),
              TextFieldWithIcon(
                controller: durationController,
                hint: 'أكتب مدة التنفيذ....',
                icon: Icons.timer,
                keyboardType: TextInputType.number,
                 validator: (value) =>
                          value == null || value.isEmpty ? "مطلوب" : null,
              ),

              const SizedBox(height: 20),

              const FieldLabel('الموقع'),
              TextFieldWithIcon(
                controller: locationController,
                hint: 'أكتب موقع المشروع....',
                icon: Icons.location_on,
                 validator: (value) =>
                          value == null || value.isEmpty ? "مطلوب" : null,
              ),

              const SizedBox(height: 20),

              const FieldLabel('وصف العرض'),
              DescriptionInputContainer(controller: desController, validator: (value) =>
                          value == null || value.isEmpty ? "مطلوب" : null,),

              const SizedBox(height: 25),

              const FieldLabel('صورة المشروع (قبل)'),
              ProfileImagePicker(
                backgroundColor: const Color(0xffCDCDCD).withAlpha(70),
                title: "أضف صورة قبل التنفيذ",
                isCircle: false,
                icon: Icons.add_photo_alternate_outlined,
                onImagePicked: (img) {
                  setState(() => beforeImage = img);
                },
              ),

              const SizedBox(height: 12),

              if (beforeImage == null &&
                  (widget.project.image1 ?? '').isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.project.image1 ?? '',
                    height: SizeConfig.h(90),
                    width: SizeConfig.w(90),
                    fit: BoxFit.cover,
                  ),
                ),

              if (beforeImage != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    beforeImage!,
                    height: SizeConfig.h(90),
                    width: SizeConfig.w(90),
                    fit: BoxFit.cover,
                  ),
                ),

              const SizedBox(height: 25),

              const FieldLabel('صورة المشروع (بعد)'),
              ProfileImagePicker(
                backgroundColor: const Color(0xffCDCDCD).withAlpha(70),
                title: "أضف صورة بعد التنفيذ",
                isCircle: false,
                icon: Icons.add_photo_alternate_outlined,
                onImagePicked: (img) {
                  setState(() => afterImage = img);
                },
              ),

              const SizedBox(height: 12),

              if (afterImage == null &&
                  (widget.project.image2 ?? '').isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.project.image2 ?? '',
                    height: SizeConfig.h(90),
                    width: SizeConfig.w(90),
                    fit: BoxFit.cover,
                  ),
                ),

              if (afterImage != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    afterImage!,
                    height: SizeConfig.h(90),
                    width: SizeConfig.w(90),
                    fit: BoxFit.cover,
                  ),
                ),

              const SizedBox(height: 15),

              CustomCheckbtn(
                value: acceptedTerms,
                onChanged: (val) => setState(() => acceptedTerms = val),
                label: "عرض مميز (يظهر في الصفحة الرئيسية)",
              ),

              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextBtn(
                    text: context.watch<OurProjectsCubit>().state.isUpdating
                        ? "جاري ..."
                        : "تعديل",
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      context.read<OurProjectsCubit>().updateProject(
                        UpdateProjectRequest(
                          projectId: widget.project.id,
                          nameAr: titleController.text,
                          companyPartner: partnerController.text,
                          durationWeeks: int.tryParse(durationController.text),
                          locationAr: locationController.text,
                          descriptionAr: desController.text,
                          isHomeFeatured: acceptedTerms ? 1 : 0,
                          image_1: beforeImage,
                          image2File: afterImage,
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
            ],
          ),
        ),
      ),
    );
  }
}
