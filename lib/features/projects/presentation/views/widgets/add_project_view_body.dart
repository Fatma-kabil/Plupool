import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/projects/data/models/update_project_model.dart';
import 'package:plupool/features/projects/presentation/manager/company_project_cubit/company_project_cubit.dart';
import 'package:plupool/features/projects/presentation/manager/company_project_cubit/compay_project_state.dart';
import 'package:plupool/features/projects/presentation/views/widgets/add_edit_project_form.dart';

class AddProjectViewBody extends StatefulWidget {
  const AddProjectViewBody({
    super.key,
    required this.clientId,
    required this.clientName,
  });
  final int clientId;
  final String clientName;
  @override
  State<AddProjectViewBody> createState() => _AddProjectViewBodyState();
}

class _AddProjectViewBodyState extends State<AddProjectViewBody> {
  final _formKey = GlobalKey<FormState>();

  final projectNameController = TextEditingController();
  final maintenanceDaysController = TextEditingController();
  final noOfPoolsController = TextEditingController();
  final locatonController = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? selectedTime;

  RequestStatus selectedPackage = RequestStatus.scheduled;

  @override
  void dispose() {
    projectNameController.dispose();
    maintenanceDaysController.dispose();
    noOfPoolsController.dispose();
    locatonController.dispose();
    super.dispose();
  }

  Future<void> onPickStartDate() async {
    final picked = await pickDateFun(context);
    if (picked != null) {
      setState(() => startDate = picked);
    }
  }

  Future<void> onPickEndDate() async {
    final picked = await pickDateFun(context);
    if (picked != null) {
      setState(() => endDate = picked);
    }
  }

  Future<void> onPickTime() async {
    final picked = await pickTimeFun(context);
    if (picked != null) {
      setState(() => selectedTime = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CompanyProjectCubit, CompanyProjectState>(
      listener: (context, state) {
        if (state.addSuccess) {
          showCustomSnackBar(
            context: context,
            message: "تم إضافة المشروع بنجاح",
            isSuccess: true,
          );

          Future.delayed(
            const Duration(milliseconds: 300),
            () => Navigator.pop(context),
          );
        }

        if (state.error != null) {
          showCustomSnackBar(
            context: context,
            message: state.error!,
            isSuccess: false,
          );
        }
      },
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: AddEditProjectForm(
                formKey: _formKey,
                projectNameController: projectNameController,
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
                projectLocationController: locatonController,
              ),
            ),
          ),

          AddEditOfferViewFooter(
            text: context.watch<CompanyProjectCubit>().state.isAdding
                ? "جاري الإضافة..."
                : "إضافة",
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;

              context.read<CompanyProjectCubit>().addProject(
                UpdateProjectRequest(
                  projectType: "pool_construction",
                  nameAr: projectNameController.text,
                  locationAr: locatonController.text,
                  poolCount: int.tryParse(noOfPoolsController.text),
                  startDate: startDate,
                  expectedEndDate: endDate,
                  preferredTime: selectedTime?.format(context),
                  clientId: widget.clientId,
                  status: selectedPackage.name,
                  isCompanyProject: 1,
                  clientName: widget.clientName,
                ),
              );
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
