import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/date_picker_field.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/done_card.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/time_picer_filed.dart';

class BookingCard extends StatefulWidget {
  final void Function(DateTime date, TimeOfDay time)? onConfirm;

  const BookingCard({super.key, this.onConfirm});

  @override
  State<BookingCard> createState() => _BookingCardState();
}
class _BookingCardState extends State<BookingCard> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  String? dateError;
  String? timeError;

  final dateFormat = intl.DateFormat('dd/MM/yyyy');

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      cancelText: 'إلغاء',
      confirmText: 'تأكيد',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.kprimarycolor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.kprimarycolor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dateError = null; // مسح الخطأ لو اختار
      });
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      cancelText: 'إلغاء',
      confirmText: 'تأكيد',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color.fromARGB(255, 165, 217, 245),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.kprimarycolor,
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        timeError = null; // مسح الخطأ لو اختار
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 29),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(
            color: AppColors.kScaffoldColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "اختر الوقت المناسب للتواصل",
                style: AppTextStyles.styleSemiBold25(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "حدد اليوم والوقت المناسب، وسيتواصل معك فريق PluPool لتأكيد تفاصيل الخدمة.",
                textDirection: TextDirection.rtl,
                style: AppTextStyles.styleRegular16(context)
                    .copyWith(color: const Color(0xff777777)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 19),
              DatePickerField(
                selectedDate: selectedDate,
                dateFormat: dateFormat,
                onTap: _pickDate,
                errorText: dateError,
              ),
              const SizedBox(height: 20),
              TimePickerField(
                selectedTime: selectedTime,
                onTap: _pickTime,
                errorText: timeError,
              ),
              const SizedBox(height: 40),
              CustomTextBtn(
                text: 'تأكيد الحجز',
                onPressed: () {
                  setState(() {
                    if (selectedDate == null) {
                      dateError = "يجب اختيار التاريخ";
                    }
                    if (selectedTime == null) {
                      timeError = "يجب اختيار الوقت";
                    }
                  });

                  if (selectedDate != null && selectedTime != null) {
                    widget.onConfirm?.call(selectedDate!, selectedTime!);
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) => DoneCard(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
