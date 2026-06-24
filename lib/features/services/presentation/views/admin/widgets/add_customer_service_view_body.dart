
import 'package:flutter/material.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/customers/domain/entities/user_entity.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
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

  /// الفنيين المختارين
  List<UserEntity> selectedTechnicians = [];

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
    return Column(
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
                setState(() {
                  selectedStatus = newStatus!;
                });
              },

              /// العميل المختار
              onCustomerSelected: (id, name) {
                setState(() {
                  selectedCustomerId = id;
                  customerNameController.text = name;
                });
              },

              /// الفنيين المختارين
              onTechniciansSelected: (techs) {
                setState(() {
                  selectedTechnicians = techs;
                });
              },
            ),
          ),
        ),

        AddEditOfferViewFooter(
          text: "إضافة",
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              print("Customer Id: $selectedCustomerId");
              print("Customer Name: ${customerNameController.text}");
              print("Service Title: ${serviceTitleController.text}");

              print(
                "Technicians: ${selectedTechnicians.map((e) => e.fullName).toList()}",
              );

              print("Date: $startDate");
              print(
                "Time: ${selectedTime?.hour}:${selectedTime?.minute}",
              );

              print(
                "Status: ${mapStatusToApi(selectedStatus)}",
              );

              /// مثال عند الحفظ
              /*
              context.read<BookingCubit>().addBooking(
                BookingEntity(
                  userId: selectedCustomerId!,
                  userName: customerNameController.text,
                  bookingType: serviceTitleController.text,
                  date: startDate!.toIso8601String(),
                  time:
                      "${selectedTime!.hour}:${selectedTime!.minute}",
                  status: mapStatusToApi(selectedStatus),
                  technicians: selectedTechnicians
                      .map((e) => e.fullName)
                      .toList(),
                  userRole: '',
                ),
              );
              */
            }
          },
        ),
      ],
    );
  }
}
