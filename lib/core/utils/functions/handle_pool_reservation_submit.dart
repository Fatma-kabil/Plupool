import 'package:flutter/material.dart';
import 'package:plupool/features/consruction_service/data/models/pool_reservation_model.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/reservation_details_dialog.dart';

void handlePoolReservationSubmit({
  required PoolReservation reservation,
  required GlobalKey<FormState> formKey,
  required void Function(PoolReservation reservation) onConfirm,
  required BuildContext context,
}) {
  // التحقق من الفاليديتور لكل TextFormField
  if (!formKey.currentState!.validate()) return;

  // تنفيذ onConfirm
  onConfirm(reservation);

  // عرض الديالوج
  showDialog(
    context: context,
    builder: (_) => ReservationDetailsDialog(
      reservation: reservation,
    ),
  );
}
