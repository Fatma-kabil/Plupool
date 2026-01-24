import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/company_res/presentation/views/widgets/add-company_form.dart';

class AddCompanyResViewBody extends StatelessWidget {
  const AddCompanyResViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final companyController = TextEditingController();
    final phoneController = TextEditingController();
    final phoneFieldKey = GlobalKey<FormFieldState>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(6)),
      child: Column(
        children: [
          AddCompanyForm(nameController: nameController, companyController: companyController, phoneFieldKey: phoneFieldKey, phoneController: phoneController),
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
