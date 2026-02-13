import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/technicains/presentation/views/widgets/edit_add_tech_form.dart';

class AddTechViewBody extends StatelessWidget {
  const AddTechViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final companyController = TextEditingController();
    final phoneController = TextEditingController();
    final TextEditingController skillsController = TextEditingController();
    final TextEditingController noOfYearsController = TextEditingController();
    final phoneFieldKey = GlobalKey<FormFieldState>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(6)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            EditAddTechForm(
              nameController: nameController,
              skillsController: skillsController,
              noOfYearsController: noOfYearsController,
              phoneFieldKey: phoneFieldKey,
              phoneController: phoneController,
              locationController: companyController,
            ),
              SizedBox(height: 40),
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
                size: SizeConfig.w(SizeConfig.isWideScreen ? 20 : 24),
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
                size: SizeConfig.w(SizeConfig.isWideScreen ? 20 : 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
