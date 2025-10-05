import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/date_picker_field.dart';
import 'package:plupool/core/utils/widgets/time_picer_filed.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/done_card.dart';

// استيراد الفانكشنات الجديدة

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
                style: AppTextStyles.styleRegular16(
                  context,
                ).copyWith(color: const Color(0xff777777)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 19),
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
                      builder: (context) => const DoneCard(),
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



 //showDialog(
   //               context: context,
     //             barrierDismissible: true,
       //           builder: (context) => BookingCard(
         //           onConfirm: (date, time) {
           //           Navigator.pop(context); // يقفل الدايالوج بعد التأكيد
             //         ScaffoldMessenger.of(context).showSnackBar(
               //         SnackBar(
                 //         content: Text(
                   //         "تم الحجز في: ${date.day}/${date.month}/${date.year} - ${time.format(context)}",
                       //   ),
                     //   ),
                     // );
                   // },
                 // ),
               // );