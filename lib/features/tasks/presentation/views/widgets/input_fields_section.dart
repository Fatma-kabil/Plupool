import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/custom_text_field.dart';
import 'package:plupool/core/utils/validators.dart'; // ✅ استيراد الفاليديتور

class InputFieldsSection extends StatelessWidget {
  final TextEditingController chlorineController;
  final TextEditingController phController;
  final TextEditingController tempController;

  const InputFieldsSection({
    super.key,
    required this.chlorineController,
    required this.phController,
    required this.tempController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildField(
          context,
          label: "مستوى الكلور",
          hint: "2.6",
          icon: Icons.science,
          controller: chlorineController,
          fieldName: "مستوى الكلور",
          recommendation: "المستوى الموصى به 1.0 - 3.0 جزء في المليون",
        ),
        SizedBox(height: SizeConfig.h(15)),
        _buildField(
          context,
          label: "مستوى الحموضة",
          hint: "7.2",
          icon: Icons.water_drop,
          controller: phController,
          fieldName: "مستوى الحموضة",
          recommendation: "المستوى الموصى به 7.2 - 7.6",
        ),
        SizedBox(height: SizeConfig.h(15)),
        _buildField(
          context,
          label: "درجة الحرارة",
          hint: "25°",
          icon: Icons.thermostat,
          controller: tempController,
          fieldName: "درجة الحرارة",
        ),
      ],
    );
  }

  Widget _buildField(
    BuildContext context, {
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    required String fieldName,
    String? recommendation,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: AppTextStyles.styleSemiBold16(context)
              .copyWith(color: AppColors.ktextcolor),
        ),
        SizedBox(height: SizeConfig.h(8)),
        CustomTextField(
          icon: icon,
          hintText: hint,
          controller: controller,
          validator: (value) => Validators.number(value, fieldName: fieldName),
        ),
        if (recommendation != null)
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.h(4)),
            child: Text(
              recommendation,
              style: AppTextStyles.styleRegular13(context)
                  .copyWith(color: const Color(0xffBBBBBB)),
              textAlign: TextAlign.right,
            ),
          ),
      ],
    );
  }
}
