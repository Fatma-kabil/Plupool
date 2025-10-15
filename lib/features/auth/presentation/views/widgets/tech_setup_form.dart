import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/custom_text_form_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/profile_image_picker.dart';
// ✅ استيراد الفاليديتور

class TechSetupForm extends StatefulWidget {
  const TechSetupForm({super.key, required this.formKey, required this.nameController, required this.locationController, required this.phoneController, required this.buildController, required this.workController});
  final GlobalKey<FormState> formKey; // ✅ استقبلنا المفتاح من البرنت
   final TextEditingController nameController;
  final TextEditingController locationController;
  final TextEditingController phoneController;

  final TextEditingController buildController;
  final TextEditingController workController;


  @override
  State<TechSetupForm> createState() => _TechSetupFormState();
}

class _TechSetupFormState extends State<TechSetupForm> {
 
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey, // ✅ استخدمنا المفتاح القادم من البرنت
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ProfileImagePicker(),

          SizedBox(height: SizeConfig.h(15)),

          // ✅ الاسم
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

          // ✅ مكان الإقامة
          Text(
            'مكان الاقامه',
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: const Color(0xff333333)),
          ),
          SizedBox(height: SizeConfig.h(4)),
          CustomTextFormField(
            controller: widget.locationController,
            hintText: 'ادخل مكان الاقامه',
            icon: Icons.location_on_outlined,
            validator: (v) => Validators.required(v, fieldName: 'مكان الإقامة'),
          ),
          SizedBox(height: SizeConfig.h(15)),

          Text(
            ' المهارات',
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: const Color(0xff333333)),
          ),
          SizedBox(height: SizeConfig.h(4)),
          CustomTextFormField(
            controller: widget.buildController,
            hintText: 'أدخل  مهاراتك هنا...',
            icon: Icons.build_outlined,
            validator: (v) => Validators.required(v),
          ),
          SizedBox(height: SizeConfig.h(15)),
          Text(
            ' عدد سنين الخبرة',
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: const Color(0xff333333)),
          ),
          SizedBox(height: SizeConfig.h(4)),
          CustomTextFormField(
            controller: widget.workController,
            hintText: 'أدخل  عدد سنين خبرتك هنا...',
            icon: Icons.work_history_outlined,
            keyboardType: TextInputType.number,
            validator: (v) => Validators.required(v),
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
            controller: widget.phoneController, // ✅ نمرره هنا
            validator: (v) => Validators.phone(v),
          ),
        ],
      ),
    );
  }
}
