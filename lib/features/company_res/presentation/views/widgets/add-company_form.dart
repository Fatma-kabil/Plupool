
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/custom_text_form_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';
import 'package:plupool/features/customers/presentation/views/widgets/status_row.dart';

class AddCompanyForm extends StatelessWidget {
  const AddCompanyForm({
    super.key,
    required this.nameController,
    required this.phoneFieldKey,
    required this.phoneController,
  });

  final TextEditingController nameController;
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
              Text(
                'الاسم',
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: const Color(0xff333333)),
              ),
              SizedBox(height: SizeConfig.h(4)),
              CustomTextFormField(
                controller: nameController,
                hintText: 'ادخل الاسم ',
                icon: Icons.person_2_outlined,
                validator: (v) => Validators.name(v),
              ),
    
            
              SizedBox(height: SizeConfig.h(15)),
    
              // رقم الهاتف
              Text(
                'رقم الهاتف',
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: const Color(0xff333333)),
              ),
              SizedBox(height: SizeConfig.h(4)),
              PhoneInputField(
                key: phoneFieldKey,
                controller: phoneController,
                validator: (v) => Validators.phone(v),
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
