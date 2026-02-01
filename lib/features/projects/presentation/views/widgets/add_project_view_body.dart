import 'package:flutter/material.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/projects/presentation/views/widgets/add_edit_project_form.dart';

class AddProjectViewBody extends StatefulWidget {
  const AddProjectViewBody({super.key});

  @override
  State<AddProjectViewBody> createState() => _AddProjectViewBodyState();
}

class _AddProjectViewBodyState extends State<AddProjectViewBody> {
  final _formKey = GlobalKey<FormState>();

  final projectNameController = TextEditingController();
  final maintenanceDaysController = TextEditingController();
  final noOfPoolsController = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? selectedTime;

  RequestStatus selectedPackage = RequestStatus.scheduled;

  @override
  void dispose() {
    projectNameController.dispose();
    maintenanceDaysController.dispose();
    noOfPoolsController.dispose();
    super.dispose();
  }

  Future<void> onPickStartDate() async {
    final picked = await pickDateFun(context);
    if (picked != null) {
      setState(() {
        startDate = picked;
      });
    }
  }

  Future<void> onPickEndDate() async {
    final picked = await pickDateFun(context);
    if (picked != null) {
      setState(() {
        endDate = picked;
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
    return SingleChildScrollView(
      child: Column(
        children: [
          AddEditProjectForm(
            formKey: _formKey,
            projectNameController: projectNameController,
            maintenanceDaysController: maintenanceDaysController,
            noOfPoolsController: noOfPoolsController,
            selectedstatus: selectedPackage,
            onStatusChanged: (val) {
              setState(() {
                selectedPackage = val!;
              });
            },
            startDate: startDate,
            endDate: endDate,
            selectedTime: selectedTime,
            onPickStartDate: onPickStartDate,
            onPickEndDate: onPickEndDate,
            onPickTime: onPickTime,
          ),
          SizedBox(height: 40),

          /// الزرار ثابت تحت
          AddEditOfferViewFooter(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // TODO: submit logic
              }
            },
            text: "إضافة",
          ),
        ],
      ),
    );
  }
}
