import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/custom_text_form_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';
import 'profile_image_picker.dart';

class TechSetupForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController locationController;
  final TextEditingController phoneController;
  final TextEditingController buildController;
  final TextEditingController workController;
  final void Function(File? image) onImagePicked;
   final GlobalKey<PhoneInputFieldState>? phoneFieldKey; // ✅ هنا

  const TechSetupForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.locationController,
    required this.phoneController,
    required this.buildController,
    required this.workController,
    required this.onImagePicked,
      this.phoneFieldKey,
  });

  @override
  State<TechSetupForm> createState() => _TechSetupFormState();
}

class _TechSetupFormState extends State<TechSetupForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ProfileImagePicker(onImagePicked: widget.onImagePicked),
          SizedBox(height: SizeConfig.h(15)),

          // الاسم
          Text('الاسم',
              style: AppTextStyles.styleSemiBold16(context)
                  .copyWith(color: const Color(0xff333333))),
          SizedBox(height: SizeConfig.h(4)),
          CustomTextFormField(
              controller: widget.nameController,
              hintText: 'ادخل اسمك',
              icon: Icons.person_2_outlined,
              validator: (v) => Validators.name(v)),
          SizedBox(height: SizeConfig.h(15)),

          // مكان الاقامة
          Text('مكان الاقامه',
              style: AppTextStyles.styleSemiBold16(context)
                  .copyWith(color: const Color(0xff333333))),
          SizedBox(height: SizeConfig.h(4)),
          CustomTextFormField(
              controller: widget.locationController,
              hintText: 'ادخل مكان الاقامه',
              icon: Icons.location_on_outlined,
              validator: (v) =>
                  Validators.required(v, fieldName: 'مكان الإقامة')),
          SizedBox(height: SizeConfig.h(15)),

          // المهارات
          Text('المهارات',
              style: AppTextStyles.styleSemiBold16(context)
                  .copyWith(color: const Color(0xff333333))),
          SizedBox(height: SizeConfig.h(4)),
          CustomTextFormField(
              controller: widget.buildController,
              hintText: 'أدخل مهاراتك مفصولة بفاصلة',
              icon: Icons.build_outlined,
              validator: (v) => Validators.required(v)),
          SizedBox(height: SizeConfig.h(15)),

          // سنوات الخبرة
          Text('عدد سنين الخبرة',
              style: AppTextStyles.styleSemiBold16(context)
                  .copyWith(color: const Color(0xff333333))),
          SizedBox(height: SizeConfig.h(4)),
          CustomTextFormField(
              controller: widget.workController,
              hintText: 'أدخل عدد سنين خبرتك',
              icon: Icons.work_history_outlined,
              keyboardType: TextInputType.number,
              validator: (v) => Validators.required(v)),
          SizedBox(height: SizeConfig.h(15)),

          // رقم الهاتف
          Text('رقم الهاتف',
              style: AppTextStyles.styleSemiBold16(context)
                  .copyWith(color: const Color(0xff333333))),
          SizedBox(height: SizeConfig.h(4)),
          PhoneInputField(
              key: widget.phoneFieldKey, // ✅ هنا
            controller: widget.phoneController,
            validator: (v) => Validators.phone(v),
          ),
        ],
      ),
    );
  }
}
