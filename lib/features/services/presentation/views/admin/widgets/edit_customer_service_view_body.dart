import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/services/domain/entities/booking_entity.dart';
import 'package:plupool/features/services/presentation/manager/booking_cubit/booking_cubit.dart';
import 'package:plupool/features/services/presentation/manager/booking_cubit/booking_state.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/edit_customer_form_service.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/tech_multi_selected_field.dart';

class EditCustomerServiceViewBody extends StatefulWidget {
  final BookingEntity booking;

  const EditCustomerServiceViewBody({super.key, required this.booking});

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

  int? selectedCustomerId;

  List<int> selectedTechnicianIds = [];
  List<String> selectedTechnicianNames = [];

  @override
  void initState() {
    super.initState();

    final booking = widget.booking;

    serviceTitleController = TextEditingController(
      text: booking.serviceName ?? "",
    );

    technicianController = TextEditingController(
      text: booking.techniciansNames.join(" - "),
    );

    customerNameController = TextEditingController(text: booking.userName);

    /// الفنيين الحاليين
    selectedTechnicianIds = List<int>.from(booking.techniciansIds);

    selectedTechnicianNames = List<String>.from(booking.techniciansNames);

    startDate = DateTime.parse(booking.date);

    final timeParts = booking.time.split(":");
    selectedTime = TimeOfDay(
      hour: int.parse(timeParts[0]),
      minute: int.parse(timeParts[1]),
    );

    selectedStatus = mapApiStatus(booking.status);
  }

  @override
  void dispose() {
    serviceTitleController.dispose();
    technicianController.dispose();
    customerNameController.dispose();
    super.dispose();
  }

  Future<void> onPickDate() async {
    final picked = await pickDateFun(context);

    if (picked != null) {
      setState(() {
        startDate = picked;
      });
    }
  }

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
          showCustomSnackBar(
            context: context,
            message: "تم التعديل بنجاح ✅",
            isSuccess: true,
          );

         context.pop(true);
        }

        if (state is BookingError) {
          showCustomSnackBar(
            context: context,
            message: state.message,
            isSuccess: false,
          );
        }
      },
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: EditCustomerFormService(
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

                initialTechnicians: List.generate(
                  widget.booking.techniciansIds.length,
                  (index) => TechnicianItem(
                    id: widget.booking.techniciansIds[index],
                    name: widget.booking.techniciansNames[index],
                  ),
                ),

                onCustomerSelected: (id, name) {
                  selectedCustomerId = id;
                  customerNameController.text = name;
                },

                onTechniciansSelected: (techs) {
                  selectedTechnicianIds = techs.map((e) => e.id).toList();

                  selectedTechnicianNames = techs.map((e) => e.name).toList();
                },
              ),
            ),
          ),

          BlocBuilder<BookingCubit, BookingState>(
            builder: (context, state) {
              final isLoading = state is BookingLoading;

              return AddEditOfferViewFooter(
                text: isLoading ? "جاري الحفظ..." : "حفظ",
                onPressed: isLoading
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          if (selectedTechnicianIds.isEmpty) {
                            showCustomSnackBar(
                              context: context,
                              message: "لازم تختار فني واحد على الأقل",
                              isSuccess: false,
                            );
                            return;
                          }
                          context.read<BookingCubit>().updateBooking(
                            id: widget.booking.id!,
                            booking: BookingEntity(
                              bookingType: "maintenance_single",
                              id: widget.booking.id,
                              userName: customerNameController.text,
                              serviceName: serviceTitleController.text,
                              date: startDate.toIso8601String(),
                              time:
                                  "${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}",
                              status: mapStatusToApi2(selectedStatus),

                              /// الفنيين
                              techniciansNames: selectedTechnicianNames,

                              techniciansIds: selectedTechnicianIds,

                              userId:
                                  selectedCustomerId ?? widget.booking.userId,

                              userRole: widget.booking.userRole,
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
