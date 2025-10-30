import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/custom_text_form_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/profile_image_picker.dart';

class CompanyRespositiveForm extends StatefulWidget {
  const CompanyRespositiveForm({
    super.key,
    required this.formKey,
    required this.phoneController,
    required this.nameController, required this.onImagePicked, this.phoneFieldKey,
    
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  final TextEditingController nameController;
  final void Function(File? image) onImagePicked;
    final GlobalKey<PhoneInputFieldState>? phoneFieldKey; // ✅ هنا


  @override
  State<CompanyRespositiveForm> createState() => _CompanyRespositiveFormState();
}

class _CompanyRespositiveFormState extends State<CompanyRespositiveForm> {
 

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        ProfileImagePicker(onImagePicked: widget.onImagePicked),

          SizedBox(height: SizeConfig.h(16)),

          // الاسم
          Text(
            'الاسم',
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: const Color(0xff333333)),
          ),
          SizedBox(height: SizeConfig.h(4)),

          CustomTextFormField(
            controller: widget.nameController,
            hintText: 'ادخل اسمك',
            icon: Icons.person_2_outlined,
            validator: (v) => Validators.name(v),
          ),
          SizedBox(height: SizeConfig.h(15)),

         
          Text(
            ' رقم الهاتف',
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: const Color(0xff333333)),
          ),
          SizedBox(height: SizeConfig.h(4)),

          PhoneInputField(
              key: widget.phoneFieldKey, // ✅ هنا
            controller: widget.phoneController, // ✅ نمرره هنا
            validator: (v) => Validators.phone(v),
          ),
        ],
      ),
    );
  }
}
