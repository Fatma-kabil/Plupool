// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
//import 'package:intl/intl.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/projects/data/models/update_project_model.dart';
import 'package:plupool/features/projects/domain/entities/company_project_entity.dart';
import 'package:plupool/features/projects/presentation/manager/company_project_cubit/company_project_cubit.dart';
import 'package:plupool/features/projects/presentation/manager/company_project_cubit/compay_project_state.dart';
import 'package:plupool/features/projects/presentation/views/widgets/add_edit_project_form.dart';

class EditProjectViewBody extends StatefulWidget {
  const EditProjectViewBody({super.key, required this.model});

  final CompanyProjectEntity model;

  @override
  State<EditProjectViewBody> createState() => _EditProjectViewBodyState();
}

class _EditProjectViewBodyState extends State<EditProjectViewBody> {
  final _formKey = GlobalKey<FormState>();

  final projectNameController = TextEditingController();
  final noOfPoolsController = TextEditingController();
  final locationController = TextEditingController();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  TimeOfDay selectedTime = const TimeOfDay(hour: 11, minute: 0);

  RequestStatus selectedPackage = RequestStatus.scheduled;

  @override
  void initState() {
    super.initState();

    projectNameController.text = widget.model.nameAr ?? "";
    locationController.text = widget.model.locationAr ?? "";
    noOfPoolsController.text = widget.model.poolCount?.toString() ?? "";

    if (widget.model.startDate != null) {
      startDate = DateTime.parse(widget.model.startDate!);
    }

    if (widget.model.expectedEndDate != null) {
      endDate = DateTime.parse(widget.model.expectedEndDate!);
    }

    if (widget.model.status != null) {
      selectedPackage = mapApiStatus(widget.model.status!);
    }
  }

  @override
  void dispose() {
    projectNameController.dispose();
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
    return BlocListener<CompanyProjectCubit, CompanyProjectState>(
      listenWhen: (previous, current) =>
          previous.updateSuccess != current.updateSuccess,
      listener: (context, state) {
        if (state.updateSuccess) {
          context.read<CompanyProjectCubit>().getCompanyProjects(
            skip: 0,
            limit: 50,
            status: getApiStatusProj(widget.model.status!), // 👈 ده المهم
          );
          showCustomSnackBar(
            context: context,
            message: "تم تحديث المشروع بنجاح",
            isSuccess: true,
          );

          if (context.canPop()) context.pop();
        }

        if (state.error != null) {
          showCustomSnackBar(
            context: context,
            message: state.error!,
            isSuccess: false,
          );
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            AddEditProjectForm(
              formKey: _formKey,
              projectNameController: projectNameController,
              projectLocationController: locationController,
              noOfPoolsController: noOfPoolsController,
              selectedstatus: selectedPackage,
              onStatusChanged: (val) {
                setState(() => selectedPackage = val!);
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
              text: context.watch<CompanyProjectCubit>().state.isUpdating
                  ? "جاري الحفظ..."
                  : "حفظ التعديلات",
              onPressed: () {
                final form = _formKey.currentState;

                // ✅ FORM VALIDATION
                if (form == null || !form.validate()) return;

                if (startDate == null) {
                  showCustomSnackBar(
                    context: context,
                    message: "تاريخ البداية مطلوب",
                    isSuccess: false,
                  );
                  return;
                }

                if (endDate == null) {
                  showCustomSnackBar(
                    context: context,
                    message: "تاريخ النهاية مطلوب",
                    isSuccess: false,
                  );
                  return;
                }

                if (selectedTime == null) {
                  showCustomSnackBar(
                    context: context,
                    message: "وقت الزيارة مطلوب",
                    isSuccess: false,
                  );
                  return;
                }

                if (selectedPackage == null) {
                  showCustomSnackBar(
                    context: context,
                    message: "نوع الباقة مطلوب",
                    isSuccess: false,
                  );
                  return;
                }

                if (endDate.isBefore(startDate)) {
                  showCustomSnackBar(
                    context: context,
                    message: "تاريخ النهاية يجب أن يكون بعد البداية",
                    isSuccess: false,
                  );
                  return;
                }

                context.read<CompanyProjectCubit>().updateProject(
                  UpdateProjectRequest(
                    projectId: widget.model.id,
                    nameAr: projectNameController.text.trim(),
                    locationAr: locationController.text,
                    poolCount: int.tryParse(noOfPoolsController.text),
                    startDate: startDate,
                    expectedEndDate: endDate,
                    preferredTime:
                        "${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}",
                    status: mapStatusToApi2(selectedPackage),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
