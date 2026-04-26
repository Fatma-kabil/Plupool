import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/services/domain/entities/booking_entity.dart';
import 'package:plupool/features/services/presentation/manager/booking_cubit/booking_cubit.dart';
import 'package:plupool/features/services/presentation/manager/booking_cubit/booking_state.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/add_customer_service_form.dart';

class EditCustomerServiceViewBody extends StatefulWidget {
  final BookingEntity booking;

  const EditCustomerServiceViewBody({
    super.key,
    required this.booking,
  });

  @override
  State<EditCustomerServiceViewBody> createState() =>
      _EditCustomerServiceViewBodyState();
}

class _EditCustomerServiceViewBodyState
    extends State<EditCustomerServiceViewBody> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController serviceTitleController;
  late TextEditingController technicianController;
  late TextEditingController customerNameController;

  late DateTime startDate;
  TimeOfDay? selectedTime;
  late RequestStatus selectedStatus;

  @override
  void initState() {
    super.initState();

    final booking = widget.booking;

    serviceTitleController =
        TextEditingController(text: booking.serviceName ?? "");

    technicianController =
        TextEditingController(text: booking.technicians.join(" - "));

    customerNameController =
        TextEditingController(text: booking.userName);

    /// 📅 Date
    startDate = DateTime.parse(booking.date);

    /// ⏰ Time
    final timeParts = booking.time.split(":");
    selectedTime = TimeOfDay(
      hour: int.parse(timeParts[0]),
      minute: int.parse(timeParts[1]),
    );

    /// 🔁 Status
    selectedStatus = mapApiStatus(booking.status);
  }

  @override
  void dispose() {
    serviceTitleController.dispose();
    technicianController.dispose();
    customerNameController.dispose();
    super.dispose();
  }

  /// 📅 Pick Date
  Future<void> onPickDate() async {
    final picked = await pickDateFun(context);
    if (picked != null) {
      setState(() {
        startDate = picked;
      });
    }
  }

  /// ⏰ Pick Time
  Future<void> onPickTime() async {
    final picked = await pickTimeFun(context);
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

 

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingCubit, BookingState>(
      listener: (context, state) {
        if (state is BookingUpdated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("تم التعديل بنجاح ✅")),
          );
          Navigator.pop(context);
        }

        if (state is BookingError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Column(
        children: [
          /// 🧾 Form
          Expanded(
            child: SingleChildScrollView(
              child: AddCustomerServiceForm(
                formKey: _formKey,
                serviceTitleController: serviceTitleController,
                technicianController: technicianController,
                customerNameController: customerNameController,
                startDate: startDate,
                onPickDate: onPickDate,
                selectedTime: selectedTime,
                onPickTime: onPickTime,
                selectedStatus: selectedStatus,
                onStatusChanged: (newStatus) {
                  setState(() {
                    selectedStatus = newStatus!;
                  });
                },
              ),
            ),
          ),

          /// 🔘 Save Button with loading
          BlocBuilder<BookingCubit, BookingState>(
            builder: (context, state) {
              final isLoading = state is BookingLoading;

              return AddEditOfferViewFooter(
                text: isLoading ? "جاري الحفظ..." : "حفظ",
                onPressed: isLoading
                    ? null // 🔥 disable button
                    : () {
                        if (_formKey.currentState!.validate()) {
                          context.read<BookingCubit>().updateBooking(
                              
                                id: widget.booking.id,
                                booking: BookingEntity(
                                  id: widget.booking.id,
                                  userName: customerNameController.text,
                                  bookingType: serviceTitleController.text,
                                  date: startDate.toIso8601String(),
                                  time:
                                      "${selectedTime!.hour}:${selectedTime!.minute}",
                                  status: mapStatusToApi(selectedStatus),
                                  technicians: technicianController.text
                                      .split(" - ")
                                      .map((e) => e.trim())
                                      .toList(), userRole: '',
                                ),
                               
                              );
                        }
                      },
              );
            },
          ),
        ],
      ),
    );
  }
}