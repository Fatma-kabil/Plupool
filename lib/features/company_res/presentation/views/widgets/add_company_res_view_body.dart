import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_form_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';
import 'package:plupool/features/customers/presentation/views/widgets/status_row.dart';

class AddCompanyResViewBody extends StatelessWidget {
  const AddCompanyResViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final companynameController = TextEditingController();
    final phoneController = TextEditingController();
    final phoneFieldKey = GlobalKey<FormFieldState>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(6)),
      child: Column(
        children: [
          Expanded(
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
            
                    // مكان الإقامة
                    Text(
                      'اسم الشركه',
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: const Color(0xff333333)),
                    ),
                    SizedBox(height: SizeConfig.h(4)),
                    CustomTextFormField(
                      controller: companynameController,
                      hintText: 'ادخل اسم الشركه',
                      icon: Icons.home_work_outlined,
                      validator: (v) =>
                          Validators.required(v, fieldName: 'اسم الشركه'),
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
                   StatusRow()
                  ],
                ),
              ),
            ),
          ),
           CustomTextBtn(
                      text: "إضافة",
                      width: double.infinity,
                      padding: SizeConfig.h(7),
            
                      textStyle: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: Colors.white),
                      trailing: Icon(
                        Icons.person_add_alt_1,
                        color: Colors.white,
                        size: SizeConfig.w(24),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(height: SizeConfig.h(15)),
                    CustomOutlinedBtn(
                      text: " إلغاء",
                      width: double.infinity,
                      trailing: Icon(
                        Icons.cancel_outlined,
                        color: AppColors.kprimarycolor,
                        size: SizeConfig.w(24),
                      ),
                    ),
        ],
      ),
    );
  }
}
