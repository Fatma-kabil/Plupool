import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/customers/presentation/views/widgets/add_edit_customer_form.dart';

class EditCustomerViewBody extends StatelessWidget {
  EditCustomerViewBody({super.key});
  final TextEditingController nameController = TextEditingController(
    text: "أحمد محمد",
  );
  final TextEditingController locationController = TextEditingController(
    text: "زهراء المعادي",
  );
  final TextEditingController phoneController = TextEditingController(
    text: "01154269877",
  );
  final phoneFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(6)),
      child: Column(
        children: [
          AddEditCustomerForm(
            locationController: locationController,
            nameController: nameController,
            phoneFieldKey: phoneFieldKey,
            phoneController: phoneController,
          ),
          CustomTextBtn(
            text: "تعديل",
            width: double.infinity,
            padding: SizeConfig.h(7),

            textStyle: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: Colors.white),
            trailing: Icon(
              Icons.edit,
              color: Colors.white,
              size: SizeConfig.w(SizeConfig.isWideScreen ? 17 : 20),
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
    );
  }
}
