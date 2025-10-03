import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/custom_back_button.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/date_picker_field.dart';
import 'package:plupool/core/utils/widgets/time_picer_filed.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:plupool/features/services/data/models/pool_model.dart';
import 'package:plupool/features/services/presentation/views/widgets/pool_reserved_header_card.dart';

class ReserveConstructionView extends StatefulWidget {
   final void Function(DateTime date, TimeOfDay time)? onConfirm;
  const ReserveConstructionView({super.key, required this.pool, this.onConfirm});
  final PoolModel pool;

  @override
  State<ReserveConstructionView> createState() => _ReserveConstructionViewState();
}

class _ReserveConstructionViewState extends State<ReserveConstructionView> {
   DateTime? selectedDate;

  TimeOfDay? selectedTime;

  String? dateError;

  String? timeError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20,
            bottom: 5,
            top: 15,
          ),
          child: ListView(
            
            children: [
              Align(
                alignment: Alignment.topLeft, // لو عايزة الباك باتون يطلع يمين
                child: CustomBackButton(),
              ),
              SizedBox(height: 15),
              PoolReserveHeaderCard(
                title: widget.pool.title,

                description: widget.pool.description,
              ),
              SizedBox(height: 15),
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
                child: Column(
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
                    const SizedBox(height: 30),
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
                      const SizedBox(height: 30),
                  ],
                ),
              ),
                  Text(
            'الاسم',
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: const Color(0xff333333)),
          ),
          const SizedBox(height: 4),
      //    CustomTextFormField(
          //  controller: _nameController,
       //     hintText: 'ادخل اسمك',
         //   icon: Icons.person_2_outlined,
         //   validator: (v) => Validators.(v),
      //    ),
              CustomTextBtn(text: "تأكيد الحجز",onPressed: () {
                
              },)
            ],
          ),
        ),
      ),
    );
  }
}
