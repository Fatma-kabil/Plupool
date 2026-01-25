import 'package:flutter/material.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/add_customer_service_form.dart';

class EditCustomerServiceViewBody extends StatefulWidget {
  const EditCustomerServiceViewBody({super.key});

  @override
  State<EditCustomerServiceViewBody> createState() =>
      _EditCustomerServiceViewBodyState();
}

class _EditCustomerServiceViewBodyState
    extends State<EditCustomerServiceViewBody> {
  final _formKey = GlobalKey<FormState>();

  final serviceTitleController = TextEditingController(text: "صيانه فلتر");
  final technicianController = TextEditingController(
    text: "علي حسين _ محمد أحمد",
  );

  DateTime startDate = DateTime(2026, 5, 2);
  TimeOfDay? selectedTime = TimeOfDay(hour: 8, minute: 30);
  RequestStatus selectedStatus = RequestStatus.scheduled;

  @override
  void dispose() {
    serviceTitleController.dispose();
    technicianController.dispose();
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
        /// المحتوى اللي بيعمل scroll
        Expanded(
          child: SingleChildScrollView(
            child: AddCustomerServiceForm(
              formKey: _formKey,
              serviceTitleController: serviceTitleController,
              technicianController: technicianController,
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

        /// الزرار ثابت تحت
        AddEditOfferViewFooter(onPressed: () {}, text: "حفظ"),
      ],
    );
  }
}
