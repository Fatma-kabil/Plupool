import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/custom_text_form_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';
import 'package:plupool/features/customers/presentation/views/widgets/status_row.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';

class AddCompanyForm extends StatelessWidget {
  const AddCompanyForm({
    super.key,
    required this.nameController,
    required this.phoneFieldKey,
    required this.phoneController,
    required this.companyController,
    required this.initialCountryCode,
    required this.initialCountryFlag,
    this.onCountryChanged, required this.isActive,
  });

  final TextEditingController nameController;
  final TextEditingController companyController;
  final GlobalKey<FormFieldState> phoneFieldKey;
  final TextEditingController phoneController;

  final String initialCountryCode;
  final String initialCountryFlag;
   final   bool isActive;

  final void Function(String code, String flag)? onCountryChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              FieldLabel('اسم ممثل الشركه'),

              CustomTextFormField(
                controller: nameController,
                hintText: 'ادخل الاسم ',
                icon: Icons.person_2_outlined,

                validator: (v) => Validators.name(v),
              ),

              SizedBox(height: SizeConfig.h(30)),

              FieldLabel('اسم الشركه'),

              CustomTextFormField(
                controller: companyController,

                hintText: 'ادخل اسم الشركه ',

                icon: Icons.business_outlined,

                validator: (v) => Validators.name(v),
              ),

              SizedBox(height: SizeConfig.h(30)),

              FieldLabel('رقم الهاتف'),

              PhoneInputField(
                key: phoneFieldKey,
                controller: phoneController,

                validator: (v) => Validators.phone(v),

                initialCountryCode: initialCountryCode,

                initialCountryFlag: initialCountryFlag,

                onCountryChanged: onCountryChanged,
              ),

              SizedBox(height: SizeConfig.h(15)),

              StatusRow(isActive: isActive,),
            ],
          ),
        ),
      ),
    );
  }
}
