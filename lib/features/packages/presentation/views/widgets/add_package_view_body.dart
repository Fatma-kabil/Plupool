import 'package:flutter/material.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/packages/presentation/views/widgets/add_edit_package_form.dart';
import 'package:plupool/features/packages/presentation/views/widgets/status_container.dart';
import 'package:plupool/features/packages/presentation/views/widgets/visits_check.dart';

class AddPackageViewBody extends StatefulWidget {
  const AddPackageViewBody({super.key});

  @override
  State<AddPackageViewBody> createState() => _AddPackageViewBodyState();
}

class _AddPackageViewBodyState extends State<AddPackageViewBody> {
  final _formKey = GlobalKey<FormState>();
 bool acceptedTerms = false;
  final visitsNumberController = TextEditingController();
  final maintenanceDaysController = TextEditingController();
  final technicianController = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? selectedTime;

  String selectedPackage = "الباقه الشهريه";

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
          StatusContainer(status: 'مجدولة'),
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
            text: "إضافة",
          ),
        ],
      ),
    );
  }
}
