import 'package:flutter/material.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
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

  DateTime? startDate;
  TimeOfDay? selectedTime;
  RequestStatus selectedStatus = RequestStatus.urgent;

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
      AddEditOfferViewFooter(
        onPressed: () {},
        text: "إضافة",
      ),
    ],
  );
}

}
