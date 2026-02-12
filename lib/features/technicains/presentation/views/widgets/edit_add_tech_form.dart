import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
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
  });
  final TextEditingController nameController;
  final TextEditingController locationController;
  final TextEditingController skillsController;
  final TextEditingController noOfYearsController;
  final GlobalKey<FormFieldState> phoneFieldKey;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // اسم العميل
              FieldLabel('اسم الفني'),

              CustomTextFormField(
                controller: nameController,
                hintText: 'ادخل الاسم ',
                icon: Icons.person_2_outlined,
                validator: (v) => Validators.name(v),
              ),

              SizedBox(height: SizeConfig.h(30)),
              FieldLabel('مكان الإقامة'),

              CustomTextFormField(
                controller: locationController,
                hintText: 'ادخل مكان الإقامة',
                icon: Icons.location_on_outlined,
                validator: (v) =>
                    Validators.required(v, fieldName: 'مكان الإقامة'),
              ),

              SizedBox(height: SizeConfig.h(30)),

              // رقم الهاتف
              FieldLabel('رقم الهاتف'),

              PhoneInputField(
                key: phoneFieldKey,
                controller: phoneController,
                validator: (v) => Validators.phone(v),
              ),
              SizedBox(height: SizeConfig.h(30)),
              FieldLabel('المهارات'),

              CustomTextFormField(
                controller: skillsController,
                hintText: 'ادخل المهارات ',
                icon: Icons.build_outlined,
                validator: (v) => Validators.name(v),
              ),

              SizedBox(height: SizeConfig.h(30)),
              FieldLabel('عدد سنوات الخبرة'),

              CustomTextFormField(
                controller: noOfYearsController,
                hintText: 'ادخل عدد سنوات الخبرة',
                icon: Icons.workspace_premium_outlined,
                validator: (v) => Validators.name(v),
              ),
              SizedBox(height: SizeConfig.h(15)),
              StatusRow(),
            ],
          ),
        ),
      ),
    );
  }
}
