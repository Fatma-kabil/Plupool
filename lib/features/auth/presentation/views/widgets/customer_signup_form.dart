import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/custom_text_form_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';

class CustomerSignupForm extends StatefulWidget {
  const CustomerSignupForm({
    super.key,
    required this.formKey,
    required this.phoneController,
    required this.nameController,
    required this.locationController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  final TextEditingController nameController;
  final TextEditingController locationController;

  @override
  State<CustomerSignupForm> createState() => _CustomerSignupFormState();
}

class _CustomerSignupFormState extends State<CustomerSignupForm> {
  File? _profileImage;
  // ✅ أضفناه

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              width: double.infinity,
              padding:  EdgeInsets.symmetric(vertical:SizeConfig.h(20) ),
              decoration: BoxDecoration(
                color: const Color(0xffE0E0E0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: _profileImage == null
                    ? Column(
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: SizeConfig.h(35),
                            color: const Color(0xff777777),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "أضف صورة (اختياري)",
                            style: AppTextStyles.styleRegular13(
                              context,
                            ).copyWith(color: const Color(0xff777777)),
                          ),
                        ],
                      )
                    : CircleAvatar(
                        radius: SizeConfig.h(45),
                        backgroundImage: FileImage(_profileImage!),
                      ),
              ),
            ),
          ),
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


          // مكان الإقامة
          Text(
            'مكان الإقامة',
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: const Color(0xff333333)),
          ),
           SizedBox(height: SizeConfig.h(4)),

          CustomTextFormField(
            controller: widget.locationController,
            hintText: 'ادخل مكان الإقامة',
            icon: Icons.location_on_outlined,
            validator: (v) => Validators.required(v, fieldName: 'مكان الإقامة'),
          ),
           SizedBox(height: SizeConfig.h(15)),


          // رقم الهاتف (من LoginForm)
          Text(
            ' رقم الهاتف',
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: const Color(0xff333333)),
          ),
           SizedBox(height: SizeConfig.h(4)),

          PhoneInputField(
            controller: widget.phoneController, // ✅ نمرره هنا
            validator: (v) => Validators.phone(v),
          ),
        ],
      ),
    );
  }
}
