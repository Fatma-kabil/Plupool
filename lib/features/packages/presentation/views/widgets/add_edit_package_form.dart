import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/date_picker_field.dart';
import 'package:plupool/core/utils/widgets/time_picer_filed.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/packages/presentation/views/widgets/weekdays_multi_select_field.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class AddEditPackageForm extends StatefulWidget {
  const AddEditPackageForm({
    super.key,
    required this.formKey,
    required this.visitsNumberController,
    required this.technicianController,
    required this.maintenanceDaysController,
    required this.selectedPackage,
    required this.onPackageChanged,
    this.startDate,
    this.endDate,
    this.selectedTime,
    required this.onPickStartDate,
    required this.onPickEndDate,
    required this.onPickTime,
  });

  final GlobalKey<FormState> formKey;

  final TextEditingController visitsNumberController;
  final TextEditingController technicianController;
  final TextEditingController maintenanceDaysController;

  final String selectedPackage;

  final ValueChanged<String?> onPackageChanged;

  final DateTime? startDate;
  final DateTime? endDate;
  final TimeOfDay? selectedTime;

  final VoidCallback onPickStartDate;
  final VoidCallback onPickEndDate;
  final VoidCallback onPickTime;

  @override
  State<AddEditPackageForm> createState() => _AddEditPackageFormState();
}

class _AddEditPackageFormState extends State<AddEditPackageForm> {
  String formatDate(DateTime? date) {
    if (date == null) return '';
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// نوع الباقة + عدد الزيارات
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel('نوع الباقه'),
                    StatusSelector<String>(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.h(12),
                        horizontal: SizeConfig.w(12),
                      ),
                      selected: widget.selectedPackage,
                      items: const [
                        "الباقه السنويه",

                        "باقه 3 شهور",
                        "الباقه الشهريه",
                      ],
                      displayText: (value) => value,
                      onChanged: widget.onPackageChanged,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel("عدد الزيارات"),
                    TextFieldWithIcon(
                      hint: "ادخل عدد الزيارات",
                      icon: Icons.list_rounded,
                      keyboardType: TextInputType.number,
                      controller: widget.visitsNumberController,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          /// تاريخ بداية الباقة
          DatePickerField(
            dirc: CrossAxisAlignment.start,
            text: "تاريخ بدايه الباقه",
            selectedDateColor: AppColors.ktextcolor,
            selectedDate: widget.startDate,
            dateFormat: formatDate,
            onTap: widget.onPickStartDate,
          ),

          const SizedBox(height: 15),

          /// تاريخ نهاية الباقة
          DatePickerField(
            dirc: CrossAxisAlignment.start,
            text: "تاريخ نهايه الباقه",
            selectedDateColor: AppColors.ktextcolor,
            selectedDate: widget.endDate,
            dateFormat: formatDate,
            onTap: widget.onPickEndDate,
          ),

          const SizedBox(height: 15),

          /// أيام الصيانة
          const FieldLabel("أيام الصيانه"),
          WeekDaysMultiSelectField(
            controller: widget.maintenanceDaysController,
          ),

          const SizedBox(height: 15),

          /// وقت الزيارة
          TimePickerField(
            dirc: CrossAxisAlignment.start,
            selectedTime: widget.selectedTime,
            selectedTimeColor: AppColors.ktextcolor,
            onTap: widget.onPickTime,
          ),

          const SizedBox(height: 15),

          /// الفنيين المسؤولين
          const FieldLabel('الفنيين المسؤولين'),
          CustomSearchPerson(
            curserHeight: SizeConfig.isWideScreen
                ? SizeConfig.w(12)
                : SizeConfig.h(20),
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.h(12),
              horizontal: SizeConfig.w(12),
            ),
            hintText: "ابحث عن فني",
            controller: widget.technicianController,
          ),

          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
