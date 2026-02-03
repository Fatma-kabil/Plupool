import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/note_text_field.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/packages/presentation/views/widgets/status_container.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';

class AddEditCompletedVisitForm extends StatefulWidget {
  const AddEditCompletedVisitForm({
    super.key,
    required this.formKey,
    required this.visitsNumberController,
    required this.phController,
    required this.chlorineController,
    required this.tempController,
    required this.notesController,
  });

  final GlobalKey<FormState> formKey;

  final TextEditingController visitsNumberController;
  final TextEditingController phController;
  final TextEditingController chlorineController;
  final TextEditingController tempController;
  final TextEditingController notesController;

  @override
  State<AddEditCompletedVisitForm> createState() =>
      _AddEditCompletedVisitFormState();
}

class _AddEditCompletedVisitFormState extends State<AddEditCompletedVisitForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FieldLabel("رقم الزيارة"),
          TextFieldWithIcon(
            hint: "ادخل رقم الزيارة",
            icon: Icons.list_rounded,
            keyboardType: TextInputType.number,
            controller: widget.visitsNumberController,
          ),
          const SizedBox(height: 15),
          const FieldLabel("حالة الزيارة"),
          StatusContainer(status: 'مكتمله'),
          const SizedBox(height: 15),
          const FieldLabel("مستوي الكلور"),
          TextFieldWithIcon(
            hint: "2.6 ppm",
            icon: Icons.science_outlined,
            keyboardType: TextInputType.number,
            controller: widget.chlorineController,
          ),
          const SizedBox(height: 7),
          Text(
            "   'المستوى الموصى به: 1.0 - 3.0 جزء في المليون",
            style: AppTextStyles.styleRegular13(
              context,
            ).copyWith(color: Color(0xffBBBBBB)),
          ),
          const SizedBox(height: 15),
          const FieldLabel("مستوي الحموضة"),
          TextFieldWithIcon(
            hint: "2.7",
            icon: Icons.water_drop_outlined,
            keyboardType: TextInputType.number,
            controller: widget.phController,
          ),
          const SizedBox(height: 7),
          Text(
            "   'المستوى الموصى به: 7.2 - 7.6 ",
            style: AppTextStyles.styleRegular13(
              context,
            ).copyWith(color: Color(0xffBBBBBB)),
          ),
          const SizedBox(height: 15),
          const FieldLabel("درجه الحراره"),
          TextFieldWithIcon(
            hint: "25°م",
            icon: Icons.thermostat,
            keyboardType: TextInputType.number,
            controller: widget.tempController,
          ),
          const SizedBox(height: 15),
          const FieldLabel(" الملاحظات"),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConfig.w(10)),
              border: Border.all(color: AppColors.textFieldBorderColor),
            ),
            child: NoteTextField(
              textStyle: AppTextStyles.styleRegular14(
                context,
              ).copyWith(color: AppColors.ktextcolor),
              cursorColor: AppColors.ktextcolor,
              size: SizeConfig.isWideScreen
                  ? SizeConfig.w(10)
                  : SizeConfig.w(20),
              controller: widget.notesController,
              onChanged: (_) {},
            ),
          ),
        ],
      ),
    );
  }
}
