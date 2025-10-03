import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/custom_back_button.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/date_picker_field.dart';
import 'package:plupool/core/utils/widgets/time_picer_filed.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:plupool/features/services/data/models/pool_model.dart';
import 'package:plupool/features/services/presentation/views/widgets/pool_reserved_header_card.dart';

class ReserveConstructionView extends StatefulWidget {
  final void Function(
    DateTime date,
    TimeOfDay time,
    double width,
    double height,
    double depth,
  )?
  onConfirm;
  const ReserveConstructionView({
    super.key,
    required this.pool,
    this.onConfirm,
  });
  final PoolModel pool;

  @override
  State<ReserveConstructionView> createState() =>
      _ReserveConstructionViewState();
}

class _ReserveConstructionViewState extends State<ReserveConstructionView> {
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
    super.dispose();
  }

  void _onConfirmPressed() {
    setState(() {
      dateError = selectedDate == null ? 'من فضلك اختر التاريخ' : null;
      timeError = selectedTime == null ? 'من فضلك اختر الوقت' : null;
    });

    if (!_formKey.currentState!.validate()) return;

    if (selectedDate != null && selectedTime != null) {
      final width = double.tryParse(_widthController.text) ?? 0.0;
      final height = double.tryParse(_heightController.text) ?? 0.0;
      final depth = double.tryParse(_depthController.text) ?? 0.0;

      if (widget.onConfirm != null) {
        widget.onConfirm!(selectedDate!, selectedTime!, width, height, depth);
      }

      // ممكن تضيف SnackBar للتأكيد
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("تم تأكيد الحجز بنجاح ✅")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20,
            bottom: 28,
            top: 15,
          ),
          child: ListView(
            children: [
              Align(alignment: Alignment.topLeft, child: CustomBackButton()),
              const SizedBox(height: 15),
              PoolReserveHeaderCard(
                title: widget.pool.title,
                description: widget.pool.description,
              ),
              const SizedBox(height: 15),
              Text(
                textDirection: TextDirection.rtl,
                '*املأ النموذج لحجز موعد إنشاء حمام السباحة الخاص بك',
                style: AppTextStyles.styleRegular16(
                  context,
                ).copyWith(color: AppColors.kprimarycolor),
              ),
              const SizedBox(height: 12),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text(
                        'عرض حمام السباحة (بالمتر) ',
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: const Color(0xff333333)),
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormField(
                        controller: _widthController,
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/width.svg',
                          color: AppColors.hintTextColor,
                          height: 24,
                          width: 24,
                        ),
                        hintText: '100 متر',
                        validator: (v) => Validators.number(v),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'ارتفاع حمام السباحة (بالمتر) ',
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: const Color(0xff333333)),
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormField(
                        controller: _heightController,
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/height.svg',
                          color: AppColors.hintTextColor,
                          height: 24,
                          width: 24,
                        ),
                        hintText: '50 متر',
                        validator: (v) => Validators.number(v),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'ارتفاع حمام السباحة (بالمتر) ',
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: const Color(0xff333333)),
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormField(
                        controller: _depthController,
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/tall.svg',
                          color: AppColors.hintTextColor,
                          height: 24,
                          width: 24,
                        ),
                        hintText: '5 متر',
                        validator: (v) => Validators.number(v),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              CustomTextBtn(text: "تأكيد الحجز", onPressed: _onConfirmPressed),
              const SizedBox(height: 28),
              CustomOutlinedBtn(
                text: "إلغاء",
                trailing: Icon(
                  Icons.cancel_outlined,
                  color: AppColors.kprimarycolor,
                  size: SizeConfig.w(24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
