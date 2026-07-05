import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/date_picker_field.dart';
import 'package:plupool/core/utils/widgets/time_picer_filed.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:plupool/features/consruction_service/data/models/pool_reservation_model.dart';
import 'package:plupool/features/consruction_service/presentation/views/manager/construction_booking_cubit/construction_booking_cubit.dart';
import 'package:plupool/features/consruction_service/presentation/views/manager/construction_booking_cubit/construction_booking_state.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/custom_pool_details%20_form.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/reservation_details_dialog.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/error_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/date_picker_field.dart';
import 'package:plupool/core/utils/widgets/time_picer_filed.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:plupool/features/consruction_service/domain/entities/construction_booking_entity.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/custom_pool_details%20_form.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/error_card.dart';

class PoolReservationForm extends StatefulWidget {
  final String poolTitle;
  final int poolId;

  const PoolReservationForm({
    super.key,
    required this.poolId,
    required this.poolTitle,
  });

  @override
  State<PoolReservationForm> createState() => _PoolReservationFormState();
}

class _PoolReservationFormState extends State<PoolReservationForm> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  String? dateError;
  String? timeError;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _tallController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _depthController = TextEditingController();

  @override
  void dispose() {
    _tallController.dispose();
    _widthController.dispose();
    _depthController.dispose();
    super.dispose();
  }

  void onConfirmPressed() {
    setState(() {
      dateError = selectedDate == null ? "من فضلك اختر التاريخ" : null;
      timeError = selectedTime == null ? "من فضلك اختر الوقت" : null;
    });

    if (selectedDate == null || selectedTime == null) return;

    final reservation = ConstructionBookingEntity(
      bookingType: "construction",
      bookingDate:
          "${selectedDate!.year.toString().padLeft(4, '0')}-"
          "${selectedDate!.month.toString().padLeft(2, '0')}-"
          "${selectedDate!.day.toString().padLeft(2, '0')}",
      bookingTime:
          "${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}:00",
      poolTypeId: widget.poolId,
      customLength: _tallController.text.trim().isEmpty
          ? null
          : double.parse(convertArabicToEnglish(_tallController.text.trim())),
      customWidth: _widthController.text.trim().isEmpty
          ? null
          : double.parse(convertArabicToEnglish(_widthController.text.trim())),
      customDepth: _depthController.text.trim().isEmpty
          ? null
          : double.parse(convertArabicToEnglish(_depthController.text.trim())),
      notes: null,
    );
    showDialog(
      context: context,
      builder: (_) => ReservationDetailsDialog(
        reservation: reservation,
        poolType: widget.poolTitle,
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
    required String iconPath,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DatePickerField(
            dirc: CrossAxisAlignment.start,
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
            dirc: CrossAxisAlignment.start,
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
            label: 'طول حمام السباحة (بالمتر)',
            controller: _tallController,
            hint: toArabicNumbers('7 متر'),
            iconPath: 'assets/icons/tall.svg',
          ),

          const SizedBox(height: 20),

          _buildTextField(
            label: 'عرض حمام السباحة (بالمتر)',
            controller: _widthController,
            hint: toArabicNumbers('4 متر'),
            iconPath: 'assets/icons/width.svg',
          ),

          const SizedBox(height: 20),

          _buildTextField(
            label: 'عمق حمام السباحة (بالمتر)',
            controller: _depthController,
            hint: toArabicNumbers('2 متر'),
            iconPath: 'assets/icons/depth.svg',
          ),

          const SizedBox(height: 30),

          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, authState) {
              return CustomTextBtn(
                text: "تأكيد الحجز",
                width: double.infinity,
                onPressed: () {
                  //  if (authState.status == AuthStatus.guest) {
                  //  showDialog(
                  //  context: context,
                  //  builder: (_) => ErrorCard(
                  //   title: 'لم يتم تسجيل الدخول',
                  //   subtitle:
                  //     'لتستمتع بتجربتك وتتابع خدماتك، قم بتسجيل الدخول أولاً.',
                  //   color: Colors.white,
                  // ),
                  // );
                  // } else {
                  onConfirmPressed();
                },
                //  },
              );
            },
          ),
        ],
      ),
    );
  }
}
