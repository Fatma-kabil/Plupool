import 'package:flutter/material.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/custom_text_form_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';
import 'package:plupool/features/customers/presentation/views/widgets/status_row.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';

class EditAddTechForm extends StatelessWidget {
  const EditAddTechForm({
    super.key,
    required this.nameController,
    required this.locationController,
    required this.skillsController,
    required this.noOfYearsController,
    required this.phoneFieldKey,
    required this.phoneController,
    required this.initialCountryCode,
    required this.initialCountryFlag,
    this.onCountryChanged,
    required this.isActive,
  });

  final TextEditingController nameController;

  final TextEditingController locationController;

  final TextEditingController skillsController;

  final TextEditingController noOfYearsController;

  final GlobalKey<FormFieldState> phoneFieldKey;

  final TextEditingController phoneController;

  final String initialCountryCode;

  final String initialCountryFlag;

  final bool isActive;

  final void Function(String code, String flag)? onCountryChanged;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          FieldLabel('اسم الفني'),

          CustomTextFormField(
            controller: nameController,

            hintText: 'ادخل الاسم ',

            icon: Icons.person_2_outlined,

            validator: (v) => Validators.name(v),
          ),

          SizedBox(height: 20),

          FieldLabel('مكان الإقامة'),

          CustomTextFormField(
            controller: locationController,

            hintText: 'ادخل مكان الإقامة',

            icon: Icons.location_on_outlined,

            validator: (v) => Validators.required(v, fieldName: 'مكان الإقامة'),
          ),

          SizedBox(height: 20),

          FieldLabel('رقم الهاتف'),

          PhoneInputField(
            key: phoneFieldKey,

            controller: phoneController,

            validator: (v) => Validators.phone(v),

            initialCountryCode: initialCountryCode,

            initialCountryFlag: initialCountryFlag,

            onCountryChanged: onCountryChanged,
          ),

          SizedBox(height: 20),

          FieldLabel('المهارات'),

          CustomTextFormField(
            controller: skillsController,

            hintText: 'ادخل المهارات ',

            icon: Icons.build_outlined,

            validator: (v) => Validators.name(v),
          ),

          SizedBox(height: 20),

          FieldLabel('عدد سنوات الخبرة'),

          CustomTextFormField(
            controller: noOfYearsController,
            keyboardType: TextInputType.number,

            hintText: 'ادخل عدد سنوات الخبرة',

            icon: Icons.workspace_premium_outlined,

            validator: (v) => Validators.number(v),
          ),

          SizedBox(height: 15),

          StatusRow(isActive: isActive),
        ],
      ),
    );
  }
}
