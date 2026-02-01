import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/date_picker_field.dart';
import 'package:plupool/core/utils/widgets/time_picer_filed.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/packages/presentation/views/widgets/weekdays_multi_select_field.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class AddEditProjectForm extends StatefulWidget {
  const AddEditProjectForm({
    super.key,
    required this.formKey,
    required this.projectNameController,
    required this.maintenanceDaysController,
    this.startDate,
    this.endDate,
    this.selectedTime,
    required this.onPickStartDate,
    required this.onPickEndDate,
    required this.onPickTime,
    required this.noOfPoolsController, required this.selectedstatus, required this.onStatusChanged,
  });

  final GlobalKey<FormState> formKey;

  final TextEditingController projectNameController;
  final TextEditingController maintenanceDaysController;
  final TextEditingController noOfPoolsController;
  
  final RequestStatus selectedstatus;

  final ValueChanged<RequestStatus?> onStatusChanged;

  final DateTime? startDate;
  final DateTime? endDate;
  final TimeOfDay? selectedTime;

  final VoidCallback onPickStartDate;
  final VoidCallback onPickEndDate;
  final VoidCallback onPickTime;

  @override
  State<AddEditProjectForm> createState() => _AddEditProjectFormState();
}

class _AddEditProjectFormState extends State<AddEditProjectForm> {
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
          const FieldLabel("اسم المشروع"),
          TextFieldWithIcon(
            hint: "ادخل اسم المشروع",
            icon: Icons.folder_open_rounded,
            keyboardType: TextInputType.text,
            controller: widget.projectNameController,
          ),
          const SizedBox(height: 15),

          /// تاريخ بداية الباقة
          DatePickerField(
             iconSize: SizeConfig.w(12),
            iconColor: AppColors.ktextcolor,
            dirc: CrossAxisAlignment.start,
            text: "تاريخ بدأ المشروع",
            selectedDateColor: AppColors.ktextcolor,
            selectedDate: widget.startDate,
            dateFormat: formatDate,
            onTap: widget.onPickStartDate,
          ),

          const SizedBox(height: 15),

          /// تاريخ نهاية الباقة
          DatePickerField(
            iconSize: SizeConfig.w(12),
            iconColor: AppColors.ktextcolor,
            dirc: CrossAxisAlignment.start,
            text: "تاريخ تسليم المشروع",
            selectedDateColor: AppColors.ktextcolor,
            selectedDate: widget.endDate,
            dateFormat: formatDate,
            onTap: widget.onPickEndDate,
          ),

          const SizedBox(height: 15),

          /// أيام الصيانة
          const FieldLabel("أيام الانشاء"),
          WeekDaysMultiSelectField(
            controller: widget.maintenanceDaysController,
          ),

          const SizedBox(height: 15),

          /// وقت الزيارة
          TimePickerField(
             iconSize: SizeConfig.w(13),
            iconColor: AppColors.ktextcolor,
            dirc: CrossAxisAlignment.start,
            selectedTime: widget.selectedTime,
            selectedTimeColor: AppColors.ktextcolor,
            onTap: widget.onPickTime,
          ),

          const SizedBox(height: 15),
          const FieldLabel("عدد المسابح"),
          TextFieldWithIcon(
            hint: "ادخل عدد المسابح",
            icon: Icons.pool_rounded,
            keyboardType: TextInputType.text,
            controller: widget.noOfPoolsController,
          ),
          const SizedBox(height: 15),
          FieldLabel('نوع الباقه'),
          StatusSelector<RequestStatus>(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.h(12),
              horizontal: SizeConfig.w(10),
            ),
            selected: widget.selectedstatus,
            items: [RequestStatus.scheduled, RequestStatus.urgent],
            displayText: (value) => getStatusText(value),
            onChanged: widget.onStatusChanged,
          ),
        ],
      ),
    );
  }
}
