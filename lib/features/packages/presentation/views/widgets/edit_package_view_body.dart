import 'package:flutter/material.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/packages/presentation/views/widgets/add_edit_package_form.dart';
import 'package:plupool/features/packages/presentation/views/widgets/visits_check.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class EditPackageViewBody extends StatefulWidget {
  const EditPackageViewBody({super.key});

  @override
  State<EditPackageViewBody> createState() => _EditPackageViewBodyState();
}

class _EditPackageViewBodyState extends State<EditPackageViewBody> {
  final _formKey = GlobalKey<FormState>();
  bool acceptedTerms = false;
  final visitsNumberController = TextEditingController(text: "4");
  final maintenanceDaysController = TextEditingController(
    text: "الاحد - الخميس",
  );
  final technicianController = TextEditingController(
    text: "احمد محمود - عمرو أسامه",
  );
final customerNameController = TextEditingController(text: "احمد محمود");
  
  DateTime startDate = DateTime(2026, 5, 1);
  DateTime endDate = DateTime(2026, 6, 1);
  TimeOfDay selectedTime = TimeOfDay(hour: 11, minute: 00);

  String selectedPackage = "الباقه الشهريه";
  RequestStatus selectedStatus = RequestStatus.inProgress;

  @override
  void dispose() {
    visitsNumberController.dispose();
    maintenanceDaysController.dispose();
    technicianController.dispose();
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// المحتوى اللي بيعمل scroll
          AddEditPackageForm(
            formKey: _formKey,
            visitsNumberController: visitsNumberController,
            maintenanceDaysController: maintenanceDaysController,
            technicianController: technicianController,
            customerNameController: customerNameController,
            startDate: startDate,
            endDate: endDate,
            selectedTime: selectedTime,

            selectedPackage: selectedPackage,

            onPackageChanged: (value) {
              setState(() {
                selectedPackage = value!;
              });
            },

            onPickStartDate: onPickStartDate,
            onPickEndDate: onPickEndDate,
            onPickTime: onPickTime,
          ),
          const FieldLabel('حاله الخدمه'),
          StatusSelector<RequestStatus>(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.h(12), // 👈 قلّلي الرقم حسب ما تحبي
              horizontal: SizeConfig.w(12),
            ),
            selected: selectedStatus,
            items: const [
              RequestStatus.scheduled,
              RequestStatus.inProgress,
              RequestStatus.completed,
            ],
            displayText: (status) => getStatusText(status),
            onChanged: (newStatus) {
              setState(() {
                selectedStatus = newStatus;
              });
            },
          ),

          SizedBox(height: 20),
          VisitsCheck(
            value: acceptedTerms,
            onChanged: (val) => setState(() => acceptedTerms = val),
          ),
          SizedBox(height: 40),

          /// الزرار ثابت تحت
          AddEditOfferViewFooter(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // TODO: submit logic
              }
            },
            text: "حفظ",
          ),
        ],
      ),
    );
  }
}
