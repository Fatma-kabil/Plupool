import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/customers/presentation/views/widgets/edit_customer_pool_info_form.dart';

class EditCustomerPoolInfoBody extends StatefulWidget {
  const EditCustomerPoolInfoBody({super.key});

  @override
  State<EditCustomerPoolInfoBody> createState() =>
      _EditCustomerPoolInfoBodyState();
}

class _EditCustomerPoolInfoBodyState extends State<EditCustomerPoolInfoBody> {
  final _formKey = GlobalKey<FormState>();

  final poolWidthController = TextEditingController();
  final poolHeightController = TextEditingController();
  final poolLengthController = TextEditingController();
  final poolVolumeController = TextEditingController();

  String selectedPoolTpe = "اسكيمير";

  @override
  void dispose() {
    poolWidthController.dispose();
    poolHeightController.dispose();
    poolLengthController.dispose();
    poolVolumeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EditCustomerPoolInfoForm(
          formKey: _formKey,
          poolWidthController: poolWidthController,
          poolHeightController: poolHeightController,
          poolLengthController: poolLengthController,
          poolVolumeController: poolVolumeController,
          selectedPackage: selectedPoolTpe,
          onPoolChanged: (value) {
            setState(() {
              selectedPoolTpe = value!;
            });
          },
        ),
    
        /// المحتوى اللي بيعمل scroll
        SizedBox(height: 40),
    
        /// الزرار ثابت تحت
        CustomTextBtn(
          text: "حفظ التغيرات",
          width: double.infinity,
          padding: SizeConfig.h(8),
    
          textStyle: AppTextStyles.styleSemiBold18(
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
            size: SizeConfig.w(SizeConfig.isWideScreen ? 18 : 22),
          ),
        ),
      ],
    );
  }
}
