import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/handle_pool_reservation_submit.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/date_picker_field.dart';
import 'package:plupool/core/utils/widgets/time_picer_filed.dart';
import 'package:plupool/core/utils/widgets/custom_text_form_field.dart';
import 'package:plupool/features/services/data/models/pool_reservation_model.dart';
import 'package:plupool/features/services/presentation/views/widgets/custom_pool_details%20_form.dart';

class PoolReservationForm extends StatefulWidget {
  final void Function(PoolReservation reservation)? onConfirm;

  const PoolReservationForm({super.key, this.onConfirm});

  @override
  State<PoolReservationForm> createState() => _PoolReservationFormState();
}

class _PoolReservationFormState extends State<PoolReservationForm> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? dateError;
  String? timeError;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _depthController = TextEditingController();

  @override
  void dispose() {
    _widthController.dispose();
    _heightController.dispose();
    _depthController.dispose();
    super.dispose();
  }

  void _onConfirmPressed() {
    handlePoolReservationSubmit(
      selectedDate: selectedDate,
      selectedTime: selectedTime,
      widthController: _widthController,
      heightController: _heightController,
      depthController: _depthController,
      formKey: _formKey,
      onConfirm: widget.onConfirm!,
      context: context,
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
    required String iconPath,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: AppTextStyles.styleSemiBold16(
            context,
          ).copyWith(color: const Color(0xff333333)),
        ),
        const SizedBox(height: 12),
        CustomPoolDetailsForm(
          iconpath: iconPath,

          controller: controller,

          hintText: hint,
          validator: (v) => Validators.number(v),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
      //  textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          DatePickerField(
            selectedDate: selectedDate,
            dateFormat: formatDate,
            onTap: () async {
              final picked = await pickDateFun(context);
              if (picked != null) {
                setState(() {
                  selectedDate = picked;
                  dateError = null;
                });
              }
            },
            errorText: dateError,
          ),
          const SizedBox(height: 20),
          TimePickerField(
            selectedTime: selectedTime,
            onTap: () async {
              final picked = await pickTimeFun(context);
              if (picked != null) {
                setState(() {
                  selectedTime = picked;
                  timeError = null;
                });
              }
            },
            errorText: timeError,
          ),
          const SizedBox(height: 20),
          _buildTextField(
            label: 'عرض حمام السباحة (بالمتر)',
            controller: _widthController,
            hint: '100 متر',
            iconPath: 'assets/icons/width.svg',
          ),
          const SizedBox(height: 20),
          _buildTextField(
            label: 'ارتفاع حمام السباحة (بالمتر)',
            controller: _heightController,
            hint: '50 متر',
            iconPath: 'assets/icons/height.svg',
          ),
          const SizedBox(height: 20),
          _buildTextField(
            label: 'عمق حمام السباحة (بالمتر)',
            controller: _depthController,
            hint: '5 متر',
            iconPath: 'assets/icons/tall.svg',
          ),
          const SizedBox(height: 30),
          CustomTextBtn(onPressed: _onConfirmPressed, text: 'تأكيد الحجز'),
        ],
      ),
    );
  }
}
