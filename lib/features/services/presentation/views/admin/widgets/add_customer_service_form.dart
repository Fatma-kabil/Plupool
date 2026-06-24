
import 'package:flutter/material.dart' hide TextField;
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/date_picker_field.dart';
import 'package:plupool/core/utils/widgets/time_picer_filed.dart';
import 'package:plupool/features/customers/domain/entities/user_entity.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/customer_serch_field.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/tech_multi_selected_field.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class AddCustomerServiceForm extends StatefulWidget {
  const AddCustomerServiceForm({
    super.key,
    required this.formKey,
    required this.serviceTitleController,
    required this.technicianController,
    required this.customerNameController,
    required this.startDate,
    required this.selectedTime,
    required this.onPickDate,
    required this.onPickTime,
    required this.selectedStatus,
    required this.onStatusChanged,
    required this.onCustomerSelected,
    required this.onTechniciansSelected,
  });

  final GlobalKey<FormState> formKey;

  final TextEditingController serviceTitleController;
  final TextEditingController technicianController;
  final TextEditingController customerNameController;

  final DateTime? startDate;
  final TimeOfDay? selectedTime;

  final VoidCallback onPickDate;
  final VoidCallback onPickTime;

  final RequestStatus selectedStatus;
  final ValueChanged<RequestStatus?> onStatusChanged;

  /// العميل المختار
  final Function(int id, String name) onCustomerSelected;

  /// الفنيين المختارين
  final Function(List<UserEntity>) onTechniciansSelected;

  @override
  State<AddCustomerServiceForm> createState() =>
      _AddCustomerServiceFormState();
}

class _AddCustomerServiceFormState extends State<AddCustomerServiceForm> {
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
          /// ================= CUSTOMER =================
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

          /// ================= SERVICE TITLE =================
          const FieldLabel('عنوان الخدمة'),

          TextFieldWithIcon(
            hint: "اكتب عنوان الخدمة",
            icon: Icons.design_services,
            validator: (value) =>
                Validators.required(value, fieldName: "اسم الخدمة"),
            controller: widget.serviceTitleController,
          ),

          const SizedBox(height: 15),

          /// ================= DATE =================
          DatePickerField(
            dirc: CrossAxisAlignment.start,
            text: "تاريخ بدء الخدمة",
            selectedDateColor: AppColors.ktextcolor,
            selectedDate: widget.startDate,
            dateFormat: formatDate,
            onTap: widget.onPickDate,
          ),

          const SizedBox(height: 15),

          /// ================= TIME =================
          TimePickerField(
            dirc: CrossAxisAlignment.start,
            selectedTime: widget.selectedTime,
            selectedTimeColor: AppColors.ktextcolor,
            onTap: widget.onPickTime,
          ),

          const SizedBox(height: 15),

          /// ================= TECHNICIANS =================
          const FieldLabel('الفنيين المسؤولين'),

          TechnicianMultiSelectField(
            controller: widget.technicianController,
            onSelected: widget.onTechniciansSelected,
          ),

          const SizedBox(height: 15),

          /// ================= STATUS =================
          const FieldLabel('حالة الخدمة'),

          StatusSelector<RequestStatus>(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.h(12),
              horizontal: SizeConfig.w(12),
            ),
            selected: widget.selectedStatus,
            items: const [
              RequestStatus.urgent,
              RequestStatus.scheduled,
                RequestStatus.completed,
            ],
            displayText: (status) => getStatusText(status),
            onChanged: widget.onStatusChanged,
          ),
        ],
      ),
    );
  }
}