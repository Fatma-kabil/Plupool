import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/projects/domain/entities/company_project_entity.dart';
import 'package:plupool/features/projects/presentation/views/widgets/add_edit_project_form.dart';

class EditProjectViewBody extends StatefulWidget {
  const EditProjectViewBody({
    super.key,
    required this.model,
  });

  final CompanyProjectEntity model;

  @override
  State<EditProjectViewBody> createState() =>
      _EditProjectViewBodyState();
}

class _EditProjectViewBodyState
    extends State<EditProjectViewBody> {
  final _formKey = GlobalKey<FormState>();

  final projectNameController = TextEditingController();
  final maintenanceDaysController = TextEditingController();
  final noOfPoolsController = TextEditingController();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  TimeOfDay selectedTime =
      const TimeOfDay(hour: 11, minute: 0);

  RequestStatus selectedPackage =
      RequestStatus.scheduled;

  @override
  void initState() {
    super.initState();

    projectNameController.text =
        widget.model.nameAr ?? "";

   maintenanceDaysController.text =
       "";

    noOfPoolsController.text =
        widget.model.poolCount?.toString() ?? "";

    if (widget.model.startDate != null) {
      startDate = DateTime.parse(
        widget.model.startDate!,
      );
    }

    if (widget.model.expectedEndDate != null) {
      endDate = DateTime.parse(
        widget.model.expectedEndDate!,
      );
    }

    if (widget.model.status != null) {
      selectedPackage = mapApiStatus(
        widget.model.status!,
      );
    }
  }

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
            projectNameController:
                projectNameController,
            maintenanceDaysController:
                maintenanceDaysController,
            noOfPoolsController:
                noOfPoolsController,
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

          const SizedBox(height: 40),

          AddEditOfferViewFooter(
            text: "حفظ التعديلات",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // استدعاء updateProject هنا
              }
            },
          ),
        ],
      ),
    );
  }
}