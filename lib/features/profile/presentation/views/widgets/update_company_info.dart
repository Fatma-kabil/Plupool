import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/custom_text_form_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';

class UpdateCompanyInfo extends StatefulWidget {
  const UpdateCompanyInfo({super.key});

  @override
  State<UpdateCompanyInfo> createState() => _UpdateCompanyInfoState();
}

class _UpdateCompanyInfoState extends State<UpdateCompanyInfo> {
   final TextEditingController nameController =
      TextEditingController(text: "أحمد السيد");
  
 
  final TextEditingController phoneController =
      TextEditingController(text: "015552222999");
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          top: SizeConfig.h(20),
          bottom: SizeConfig.h(20),
          right: SizeConfig.w(12),

          left: SizeConfig.w(12)
          ),
          
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // الاسم
          Text('الاسم',
              style: AppTextStyles.styleMedium16(context)
                  .copyWith(color: const Color(0xff555555))),
          SizedBox(height: SizeConfig.h(6)),
          CustomTextFormField(
              controller: nameController,
              hintText: 'ادخل اسمك',
              icon: Icons.person_2_outlined,
              validator: (v) => Validators.name(v)),
          SizedBox(height: SizeConfig.h(15)),

          // مكان الإقامة
          

          // رقم الهاتف
          Text('رقم الهاتف',
              style: AppTextStyles.styleMedium16(context)
                  .copyWith(color: const Color(0xff555555))),
          SizedBox(height: SizeConfig.h(6)),
          PhoneInputField(
            controller: phoneController,
            validator: (v) => Validators.phone(v),
          ),
        ],
      ),
    );
  }
}