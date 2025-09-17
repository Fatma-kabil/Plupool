import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';// ✅ استيراد الفاليديتور
class CustomerSetupForm extends StatefulWidget {
  const CustomerSetupForm({super.key, required this.formKey});
  final GlobalKey<FormState> formKey; // ✅ استقبلنا المفتاح من البرنت

  @override
  State<CustomerSetupForm> createState() => _CustomerSetupFormState();
}

class _CustomerSetupFormState extends State<CustomerSetupForm> {
  File? _profileImage;

  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
      key: widget.formKey, // ✅ استخدمنا المفتاح القادم من البرنت
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
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

          const SizedBox(height: 16),

          // ✅ الاسم
          Text(
            'الاسم',
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff333333)),
          ),
          const SizedBox(height: 4),
          CustomTextFormField(
            controller: _nameController,
            hintText: 'ادخل اسمك',
            icon: Icons.person,
            validator: (v) => Validators.name(v),
          ),
          const SizedBox(height: 14),

          // ✅ مكان الإقامة
          Text(
            'مكان الاقامه',
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff333333)),
          ),
          const SizedBox(height: 4),
          CustomTextFormField(
            controller: _locationController,
            hintText: 'ادخل مكان الاقامه',
            icon: Icons.location_on,
            validator: (v) => Validators.required(v, fieldName: 'مكان الإقامة'),
          ),
          const SizedBox(height: 14),

          // ✅ البريد الإلكتروني
          Text(
            'البريد الالكتروني',
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff333333)),
          ),
          const SizedBox(height: 4),
          CustomTextFormField(
            controller: _emailController,
            hintText: 'أدخل بريدك الالكتروني',
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            validator: (v)  => Validators.email(v),
          ),
          const SizedBox(height: 14),

          // ✅ كلمة المرور
          Text(
            'كلمة المرور',
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff333333)),
          ),
          const SizedBox(height: 4),
          CustomTextFormField(
            controller: _passwordController,
            hintText: 'أدخل كلمة المرور',
            icon: Icons.lock,
         //   sufficon: Icons.visibility,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            validator: (v) => Validators.password(v),
          ),
          const SizedBox(height: 14),

          // ✅ رقم الهاتف
          Text(
            'رقم الهاتف',
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff333333)),
          ),
          const SizedBox(height: 4),
          PhoneInputField(
            validator: (v) => Validators.phone(v),
          ),
          const SizedBox(height: 4),

          Text(
            '*الرقم لن يكون مرئيا للمستخدمين الاخرين في التطبيق',
            style: AppTextStyles.styleRegular10(context),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}
