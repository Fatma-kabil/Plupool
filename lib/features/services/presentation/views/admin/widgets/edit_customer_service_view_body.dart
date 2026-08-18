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

  // ============================================================
  // Controllers
  // ============================================================

  late TextEditingController serviceTitleController;

  late TextEditingController technicianController;

  late TextEditingController customerNameController;

  late TextEditingController companyResNameController;

  // ============================================================
  // Date / Time / Status
  // ============================================================

  late DateTime startDate;

  TimeOfDay? selectedTime;

  late RequestStatus selectedStatus;

  // ============================================================
  // IDs
  // ============================================================

  int? selectedCustomerId;

  int? selectedCompanyResId;

  // ============================================================
  // Technicians
  // ============================================================

  List<int> selectedTechnicianIds = [];

  List<String> selectedTechnicianNames = [];

  // ============================================================
  // INIT
  // ============================================================

  @override
  void initState() {
    super.initState();

    final booking = widget.booking;

    // ============================================================
    // Service
    // ============================================================

    serviceTitleController = TextEditingController(
      text: booking.serviceName ?? "",
    );

    // ============================================================
    // Technicians
    // ============================================================

    technicianController = TextEditingController(
      text: booking.techniciansNames.join(" - "),
    );

    selectedTechnicianIds = List<int>.from(booking.techniciansIds);

    selectedTechnicianNames = List<String>.from(booking.techniciansNames);

    // ============================================================
    // Customer
    // ============================================================

    customerNameController = TextEditingController(text: booking.userName);

    selectedCustomerId = booking.userId;

    // ============================================================
    // Company Representative
    // ============================================================

    companyResNameController = TextEditingController(
      text: booking.companyReName ?? "",
    );

    selectedCompanyResId = booking.companyRepId;

    // ============================================================
    // Date
    // ============================================================

    startDate = DateTime.parse(booking.date);

    // ============================================================
    // Time
    // ============================================================

    final timeParts = booking.time.split(":");

    selectedTime = TimeOfDay(
      hour: int.parse(timeParts[0]),
      minute: int.parse(timeParts[1]),
    );

    // ============================================================
    // Status
    // ============================================================

    selectedStatus = mapApiStatus(booking.status);

    // Debug
    print("EDIT companyRepId = $selectedCompanyResId");

    print("EDIT companyRepName = ${companyResNameController.text}");
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    serviceTitleController.dispose();

    technicianController.dispose();

    customerNameController.dispose();

    companyResNameController.dispose();

    super.dispose();
  }

  // ============================================================
  // PICK DATE
  // ============================================================

  Future<void> onPickDate() async {
    final picked = await pickDateFun(context);

    if (picked != null) {
      setState(() {
        startDate = picked;
      });
    }
  }

  // ============================================================
  // PICK TIME
  // ============================================================

  Future<void> onPickTime() async {
    final picked = await pickTimeFun(context);

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  // ============================================================
  // UPDATE
  // ============================================================

  void _updateBooking() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // ============================================================
    // Technician validation
    // ============================================================

    if (selectedTechnicianIds.isEmpty) {
      showCustomSnackBar(
        context: context,
        message: "لازم تختار فني واحد على الأقل",
        isSuccess: false,
      );

      return;
    }

    // ============================================================
    // Time validation
    // ============================================================

    if (selectedTime == null) {
      showCustomSnackBar(
        context: context,
        message: "لازم تختار الوقت",
        isSuccess: false,
      );

      return;
    }

    // ============================================================
    // Company Representative
    //
    // OPTIONAL
    //
    // لو المستخدم اختاره -> ID + Name
    // لو مش اختاره -> null
    // ============================================================

    final companyName = companyResNameController.text.trim();

    final companyRepName = companyName.isEmpty ? null : companyName;

    // ============================================================
    // Booking Entity
    // ============================================================

    final booking = BookingEntity(
      id: widget.booking.id,

      bookingType: "maintenance_single",

      userName: customerNameController.text,

      userRole: widget.booking.userRole,

      userId: selectedCustomerId ?? widget.booking.userId,

      serviceName: serviceTitleController.text,

      serviceId: widget.booking.serviceId,

      date: startDate.toIso8601String(),

      time:
          "${selectedTime!.hour.toString().padLeft(2, '0')}:"
          "${selectedTime!.minute.toString().padLeft(2, '0')}",

      status: mapStatusToApi2(selectedStatus),

      techniciansNames: selectedTechnicianNames,

      techniciansIds: selectedTechnicianIds,

      // ========================================================
      // COMPANY REPRESENTATIVE
      // ========================================================
      companyRepId: selectedCompanyResId,

      companyReName: companyRepName,
    );

    // ============================================================
    // DEBUG
    // ============================================================

    print("================ UPDATE BOOKING ================");

    print("booking id = ${booking.id}");

    print("customer id = ${booking.userId}");

    print("customer name = ${booking.userName}");

    print("company rep id = ${booking.companyRepId}");

    print("company rep name = ${booking.companyReName}");

    print("technicians = ${booking.techniciansIds}");

    print("================================================");

    // ============================================================
    // CALL UPDATE
    // ============================================================

    context.read<BookingCubit>().updateBooking(
      id: widget.booking.id!,
      booking: booking,
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingCubit, BookingState>(
      listener: (context, state) {
        // ========================================================
        // SUCCESS
        // ========================================================

        if (state is BookingUpdated) {
          showCustomSnackBar(
            context: context,
            message: "تم التعديل بنجاح ✅",
            isSuccess: true,
          );

          context.pop(true);
        }

        // ========================================================
        // ERROR
        // ========================================================

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
          // ======================================================
          // FORM
          // ======================================================
          Expanded(
            child: SingleChildScrollView(
              child: EditCustomerFormService(
                formKey: _formKey,

                serviceTitleController: serviceTitleController,

                technicianController: technicianController,

                customerNameController: customerNameController,

                // ==================================================
                // COMPANY REPRESENTATIVE
                // ==================================================
                companyResNameController: companyResNameController,

                // ==================================================
                // DATE
                // ==================================================
                startDate: startDate,

                onPickDate: onPickDate,

                // ==================================================
                // TIME
                // ==================================================
                selectedTime: selectedTime,

                onPickTime: onPickTime,

                // ==================================================
                // STATUS
                // ==================================================
                selectedStatus: selectedStatus,

                onStatusChanged: (newStatus) {
                  if (newStatus == null) {
                    return;
                  }

                  setState(() {
                    selectedStatus = newStatus;
                  });
                },

                // ==================================================
                // INITIAL TECHNICIANS
                // ==================================================
                initialTechnicians: List.generate(
                  widget.booking.techniciansIds.length,
                  (index) {
                    return TechnicianItem(
                      id: widget.booking.techniciansIds[index],

                      name: widget.booking.techniciansNames[index],
                    );
                  },
                ),

                // ==================================================
                // CUSTOMER
                // ==================================================
                onCustomerSelected: (id, name) {
                  selectedCustomerId = id;

                  customerNameController.text = name;
                },

                // ==================================================
                // COMPANY REPRESENTATIVE
                // ==================================================
                onCompanyRepSelected: (id, name) {
                  selectedCompanyResId = id;

                  companyResNameController.text = name;

                  print("Selected Company ID = $id");

                  print("Selected Company Name = $name");
                },

                // ==================================================
                // TECHNICIANS
                // ==================================================
                onTechniciansSelected: (techs) {
                  selectedTechnicianIds = techs.map((e) => e.id).toList();

                  selectedTechnicianNames = techs.map((e) => e.name).toList();
                },
              ),
            ),
          ),

          // ======================================================
          // FOOTER
          // ======================================================
          BlocBuilder<BookingCubit, BookingState>(
            builder: (context, state) {
              final isLoading = state is BookingLoading;

              return AddEditOfferViewFooter(
                text: isLoading ? "جاري الحفظ..." : "حفظ",

                onPressed: isLoading ? null : _updateBooking,
              );
            },
          ),
        ],
      ),
    );
  }
}
