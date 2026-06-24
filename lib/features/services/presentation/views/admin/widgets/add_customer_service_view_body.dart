import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/services/domain/entities/booking_entity.dart';
import 'package:plupool/features/services/presentation/manager/booking_cubit/booking_cubit.dart';
import 'package:plupool/features/services/presentation/manager/booking_cubit/booking_state.dart';
import 'add_customer_service_form.dart';

class AddCustomerServiceViewBody extends StatefulWidget {
  const AddCustomerServiceViewBody({super.key});

  @override
  State<AddCustomerServiceViewBody> createState() =>
      _AddCustomerServiceViewBodyState();
}

class _AddCustomerServiceViewBodyState
    extends State<AddCustomerServiceViewBody> {
  final _formKey = GlobalKey<FormState>();

  final serviceTitleController = TextEditingController();
  final technicianController = TextEditingController();
  final customerNameController = TextEditingController();

  int? selectedCustomerId;

  List<int> selectedTechnicianIds = [];
  List<String> selectedTechnicianNames = [];

  DateTime? startDate;
  TimeOfDay? selectedTime;

  RequestStatus selectedStatus = RequestStatus.urgent;

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
      setState(() => startDate = picked);
    }
  }

  Future<void> onPickTime() async {
    final picked = await pickTimeFun(context);
    if (picked != null) {
      setState(() => selectedTime = picked);
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    if (selectedCustomerId == null) {
      showCustomSnackBar(
        context: context,
        message: "لازم تختار عميل",
        isSuccess: false,
      );
      return;
    }

    if (selectedTechnicianIds.isEmpty) {
      showCustomSnackBar(
        context: context,
        message: "لازم تختار فني واحد على الأقل",
        isSuccess: false,
      );
      return;
    }

    if (startDate == null || selectedTime == null) {
      showCustomSnackBar(
        context: context,
        message: "لازم تختار التاريخ والوقت",
        isSuccess: false,
      );
      return;
    }

    context.read<BookingCubit>().addBooking(
      booking: BookingEntity(
        userId: selectedCustomerId!,
        serviceName: serviceTitleController.text,
        userName: customerNameController.text,
        bookingType: "maintenance_single",
        date: startDate!.toIso8601String(),
        time:
            "${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}",
        status: mapStatusToApi2(selectedStatus),

        techniciansIds: selectedTechnicianIds,
        techniciansNames: selectedTechnicianNames,

        userRole: '',
      ),
    );
    print("customerId = $selectedCustomerId");
    print("technicians = $selectedTechnicianIds");
    print("date = $startDate");
    print("time = $selectedTime");
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingCubit, BookingState>(
      listener: (context, state) {
        if (state is BookingAdded) {
          showCustomSnackBar(
            context: context,
            message: "تمت الإضافة بنجاح ✅",
            isSuccess: true,
          );
          Navigator.pop(context);
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
                  setState(() => selectedStatus = newStatus!);
                },

                initialTechnicians: const [],

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
                text: isLoading ? "جاري الإضافة..." : "إضافة",
                onPressed: isLoading ? null : _submit,
              );
            },
          ),
        ],
      ),
    );
  }
}
