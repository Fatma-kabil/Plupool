import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/date_picker_field.dart';
import 'package:plupool/core/utils/widgets/time_picer_filed.dart';
import 'package:plupool/features/customers/domain/entities/user_entity.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/packages/presentation/views/widgets/weekdays_multi_select_field.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/customer_serch_field.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/tech_multi_selected_field.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class AddPackageForm extends StatefulWidget {
  const AddPackageForm({
    super.key,
    required this.formKey,
    required this.visitsNumberController,
    required this.technicianController,
    required this.maintenanceDaysController,
    required this.customerNameController,
    required this.selectedPackage,
    required this.onPackageChanged,
    this.startDate,
    this.endDate,
    this.selectedTime,
    required this.onPickStartDate,
    required this.onPickEndDate,
    required this.onPickTime,
    required this.onCustomerSelected,
    required this.onTechniciansSelected,
    required this.initialTechnicians,
  });

  final GlobalKey<FormState> formKey;

  final TextEditingController visitsNumberController;
  final TextEditingController technicianController;
  final TextEditingController maintenanceDaysController;
  final TextEditingController customerNameController;

  final String selectedPackage;

  final ValueChanged<String?> onPackageChanged;

  final DateTime? startDate;
  final DateTime? endDate;
  final TimeOfDay? selectedTime;

  final VoidCallback onPickStartDate;
  final VoidCallback onPickEndDate;
  final VoidCallback onPickTime;

  /// العميل المختار
  final Function(int id, String name) onCustomerSelected;

  /// الفنيين المختارين
  final Function(List<TechnicianItem>) onTechniciansSelected;

  /// الفنيين الحاليين
  final List<TechnicianItem> initialTechnicians;

  @override
  State<AddPackageForm> createState() => _AddPackageFormState();
}

class _AddPackageFormState extends State<AddPackageForm> {
  String formatDate(DateTime? date) {
    if (date == null) return '';
    return "${date.year}/${date.month}/${date.day}";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FieldLabel("اسم العميل"),

          CustomerSearchField(
            controller: widget.customerNameController,
            onSelected: (UserEntity user) {
              widget.customerNameController.text = user.fullName;

              widget.onCustomerSelected(
                user.id,
                user.fullName,
              );
            },
          ),

          const SizedBox(height: 15),

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

          const SizedBox(height: 15),

          const FieldLabel("عدد الزيارات"),

          TextFieldWithIcon(
            hint: "ادخل عدد الزيارات",
            icon: Icons.list_rounded,
            keyboardType: TextInputType.number,
            controller: widget.visitsNumberController,
          ),

          const SizedBox(height: 15),

          DatePickerField(
            iconSize: SizeConfig.w(13),
            iconColor: AppColors.ktextcolor,
            dirc: CrossAxisAlignment.start,
            text: "تاريخ بدايه الباقه",
            selectedDateColor: AppColors.ktextcolor,
            selectedDate: widget.startDate,
            dateFormat: formatDate,
            onTap: widget.onPickStartDate,
          ),

          const SizedBox(height: 15),

          DatePickerField(
            iconSize: SizeConfig.w(13),
            iconColor: AppColors.ktextcolor,
            dirc: CrossAxisAlignment.start,
            text: "تاريخ نهايه الباقه",
            selectedDateColor: AppColors.ktextcolor,
            selectedDate: widget.endDate,
            dateFormat: formatDate,
            onTap: widget.onPickEndDate,
          ),

          const SizedBox(height: 15),

          const FieldLabel("أيام الصيانه"),

          WeekDaysMultiSelectField(
            controller: widget.maintenanceDaysController,
          ),

          const SizedBox(height: 15),

          TimePickerField(
            iconSize: SizeConfig.w(13),
            iconColor: AppColors.ktextcolor,
            dirc: CrossAxisAlignment.start,
            selectedTime: widget.selectedTime,
            selectedTimeColor: AppColors.ktextcolor,
            onTap: widget.onPickTime,
          ),

          const SizedBox(height: 15),

          const FieldLabel('الفنيين المسؤولين'),

          TechnicianMultiSelectField(
            controller: widget.technicianController,
            onSelected: widget.onTechniciansSelected,
            initialTechnicians: widget.initialTechnicians,
          ),

          const SizedBox(height: 15),
        ],
      ),
    );
  }
}