import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/custom_text_form_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';
import 'package:plupool/features/customers/presentation/views/widgets/status_row.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';

class AddEditCustomerForm extends StatelessWidget {
  const AddEditCustomerForm({
    super.key,
    required this.nameController,
    required this.locationController,
    required this.phoneFieldKey,
    required this.phoneController,
    required this.initialCountryCode,
    required this.initialCountryFlag,
    this.onCountryChanged,
    required this.isActive,
    this.onActiveChanged,
    required this.formKey,
  });

  final TextEditingController nameController;

  final TextEditingController locationController;

  final GlobalKey<FormFieldState> phoneFieldKey;

  final TextEditingController phoneController;

  final String initialCountryCode;

  final String initialCountryFlag;

  final bool isActive;
  final ValueChanged<bool>? onActiveChanged;
  final GlobalKey<FormState> formKey;


  final void Function(
    String code,
    String flag,
  )? onCountryChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              FieldLabel('اسم العميل'),

              CustomTextFormField(
                controller: nameController,

                hintText: 'ادخل الاسم ',

                icon:
                    Icons.person_2_outlined,

                validator:
                    (v) => Validators.name(v),
              ),

              SizedBox(
                height: SizeConfig.h(30),
              ),

              FieldLabel('مكان الإقامة'),

              CustomTextFormField(
                controller:
                    locationController,

                hintText:
                    'ادخل مكان الإقامة',

                icon:
                    Icons.location_on_outlined,

                validator:
                    (v) => Validators.required(
                      v,
                      fieldName:
                          'مكان الإقامة',
                    ),
              ),

              SizedBox(
                height: SizeConfig.h(30),
              ),

              FieldLabel('رقم الهاتف'),

              PhoneInputField(
                key: phoneFieldKey,

                controller:
                    phoneController,

                validator:
                    (v) => Validators.phone(v),

                initialCountryCode:
                    initialCountryCode,

                initialCountryFlag:
                    initialCountryFlag,

                onCountryChanged:
                    onCountryChanged,
              ),

              SizedBox(
                height: SizeConfig.h(15),
              ),

              StatusRow(
                isActive: isActive,
                  onChanged: onActiveChanged!,

              ),
            ],
          ),
        ),
      ),
    );
  }
}