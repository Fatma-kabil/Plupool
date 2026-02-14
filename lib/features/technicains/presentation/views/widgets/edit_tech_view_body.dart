import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/technicains/presentation/views/widgets/edit_add_tech_form.dart';

class EditTechViewBody extends StatelessWidget {
   EditTechViewBody({super.key});
    final nameController = TextEditingController(text: "أحمد محمد");
    final locationController = TextEditingController(text: "مدينة نصر ");
    final phoneController = TextEditingController(text: "01125467433");
    final TextEditingController skillsController = TextEditingController(text: "صيانه فلتر - تنظيف حمامات السباحه");
    final TextEditingController noOfYearsController = TextEditingController(text: "5");
    final phoneFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {

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
              locationController: locationController,
            ),
              SizedBox(height: 40),
            CustomTextBtn(
              text: "تعديل",
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
