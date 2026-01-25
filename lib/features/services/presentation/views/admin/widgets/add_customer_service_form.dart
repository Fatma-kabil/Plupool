import 'package:flutter/material.dart' hide TextField;
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/date_picker_field.dart';
import 'package:plupool/core/utils/widgets/time_picer_filed.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class AddCustomerServiceForm extends StatefulWidget {
  const AddCustomerServiceForm({
    super.key,
    required this.formKey,
    required this.serviceTitleController,
    required this.technicianController,
    required this.startDate,
    required this.selectedTime,
    required this.onPickDate,
    required this.onPickTime,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController serviceTitleController;
  final TextEditingController technicianController;

  final DateTime? startDate;
  final TimeOfDay? selectedTime;

  final VoidCallback onPickDate;
  final VoidCallback onPickTime;

  final RequestStatus selectedStatus;
  final ValueChanged<RequestStatus?> onStatusChanged; // callback

  @override
  State<AddCustomerServiceForm> createState() => _AddCustomerServiceFormState();
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
          /// عنوان الخدمة
          const FieldLabel('عنوان الخدمة'),
          TextFieldWithIcon(
            hint: "اكتب عنوان الخدمة",
            icon: Icons.design_services,
            controller: widget.serviceTitleController,
          ),

          const SizedBox(height: 15),

          DatePickerField(
            dirc: CrossAxisAlignment.start,
            text: "تاريخ بدء الخدمة",
            selectedDateColor: AppColors.ktextcolor,
            selectedDate: widget.startDate,
            dateFormat: formatDate,
            onTap: widget.onPickDate,
          ),

          const SizedBox(height: 15),

          TimePickerField(
            dirc: CrossAxisAlignment.start,
            selectedTime: widget.selectedTime,
            selectedTimeColor:  AppColors.ktextcolor,
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
              vertical: SizeConfig.h(12), // 👈 قلّلي الرقم حسب ما تحبي
              horizontal: SizeConfig.w(12),
            ),
            hintText: "ابحث عن فني",
            controller: widget.technicianController,
          ),
          const SizedBox(height: 15),

          /// الفنيين المسؤولين
          const FieldLabel(' حاله الخدمه'),
          StatusSelector<RequestStatus>(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.h(12), // 👈 قلّلي الرقم حسب ما تحبي
              horizontal: SizeConfig.w(12)),
            selected: widget.selectedStatus,
            items: const [RequestStatus.scheduled, RequestStatus.urgent],
            displayText: (status) => getStatusText(status),
            onChanged: widget.onStatusChanged,
          ),
        ],
      ),
    );
  }
}
