import 'package:flutter/material.dart';
import 'package:plupool/features/services/data/models/pool_reservation_model.dart';


void handlePoolReservationSubmit({
  required DateTime? selectedDate,
  required TimeOfDay? selectedTime,
  required TextEditingController widthController,
  required TextEditingController heightController,
  required TextEditingController depthController,
  required GlobalKey<FormState> formKey,
  required void Function(PoolReservation reservation) onConfirm,
  required BuildContext context,
}) {
  String? dateError = selectedDate == null ? 'من فضلك اختر التاريخ' : null;
  String? timeError = selectedTime == null ? 'من فضلك اختر الوقت' : null;

  if (!formKey.currentState!.validate()) return;

  if (selectedDate != null && selectedTime != null) {
    final reservation = PoolReservation(
      date: selectedDate,
      time: selectedTime,
      width: double.tryParse(widthController.text) ?? 0.0,
      height: double.tryParse(heightController.text) ?? 0.0,
      depth: double.tryParse(depthController.text) ?? 0.0,
    );

    onConfirm(reservation);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("تم تأكيد الحجز بنجاح ✅")),
    );
  } else {
    if (dateError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(dateError)),
      );
    } else if (timeError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(timeError)),
      );
    }
  }
}
