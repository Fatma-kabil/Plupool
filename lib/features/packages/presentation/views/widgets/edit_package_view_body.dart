import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';

import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';

import 'package:plupool/features/packages/data/models/update_package_request.dart';
import 'package:plupool/features/packages/presentation/manager/package_cubit/package_cubit.dart';
import 'package:plupool/features/packages/presentation/manager/package_cubit/package_state.dart';
import 'package:plupool/features/packages/presentation/views/widgets/add_package_form.dart';

import 'package:plupool/features/services/domain/entities/user_booking_entity.dart';
import 'package:plupool/features/services/presentation/manager/user_booking_cubit/user_booking_cubit.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/tech_multi_selected_field.dart';

import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class EditPackageViewBody extends StatefulWidget {
  final UserBookingEntity model;

  const EditPackageViewBody({super.key, required this.model});

  @override
  State<EditPackageViewBody> createState() => _EditPackageViewBodyState();
}

class _EditPackageViewBodyState extends State<EditPackageViewBody> {
  final _formKey = GlobalKey<FormState>();

  // ============================================================
  // Controllers
  // ============================================================

  late TextEditingController visitsNumberController;
  late TextEditingController maintenanceDaysController;
  late TextEditingController technicianController;
  late TextEditingController customerNameController;
  late TextEditingController companyResNameController;

  // ============================================================
  // Date / Time
  // ============================================================

  late DateTime startDate;
  late DateTime endDate;
  TimeOfDay? selectedTime;

  // ============================================================
  // Package
  // ============================================================

  late String selectedPackage;
  late RequestStatus selectedStatus;

  // ============================================================
  // Customer
  // ============================================================

  int? selectedCustomerId;

  // ============================================================
  // Company Representative
  // ============================================================

  int? selectedCompanyResId;

  // ============================================================
  // Technicians
  // ============================================================

  List<int> selectedTechnicianIds = [];
  List<String> selectedTechnicianNames = [];

  // ============================================================
  // Visits
  // ============================================================

  bool acceptedTerms = false;

  // ============================================================
  // INIT
  // ============================================================

  @override
  void initState() {
    super.initState();

    final model = widget.model;

    // ==========================================================
    // Visits
    // ==========================================================

    visitsNumberController = TextEditingController(
      text: (model.visitCount ?? 0).toString(),
    );

    // ==========================================================
    // Maintenance Days
    //
    // UserBookingEntity doesn't contain maintenanceDays.
    // Leave it empty initially.
    // ==========================================================

    maintenanceDaysController = TextEditingController();

    // ==========================================================
    // Technicians
    // ==========================================================

    selectedTechnicianIds = List<int>.from(model.techniciansIds ?? []);

    selectedTechnicianNames = List<String>.from(model.technicians ?? []);

    technicianController = TextEditingController(
      text: selectedTechnicianNames.join(" - "),
    );

    // ==========================================================
    // Customer
    // ==========================================================

    customerNameController = TextEditingController(text: model.userName);

    selectedCustomerId = model.userId;

    // ==========================================================
    // Company Representative
    // ==========================================================

    companyResNameController = TextEditingController(
      text: model.companyRepName ?? "",
    );

    // ==========================================================
    // IMPORTANT:
    // UserBookingEntity currently doesn't have companyRepId.
    // So we cannot initialize selectedCompanyResId.
    // ==========================================================

    selectedCompanyResId = null;

    // ==========================================================
    // Start Date
    // ==========================================================

    startDate = DateTime.parse(model.date);

    // ==========================================================
    // End Date
    //
    // UserBookingEntity doesn't contain endDate.
    // For now use the same date.
    // ==========================================================

    endDate = DateTime.parse(model.date);

    // ==========================================================
    // Time
    // ==========================================================

    final timeParts = model.time.split(":");

    selectedTime = TimeOfDay(
      hour: int.parse(timeParts[0]),
      minute: int.parse(timeParts[1]),
    );

    // ==========================================================
    // Package Name
    //
    // UserBookingEntity doesn't have package name.
    // If serviceName is the package name in your response,
    // use it.
    // ==========================================================

    selectedPackage = model.serviceName ?? "";

    // ==========================================================
    // Status
    // ==========================================================

    selectedStatus = mapApiStatus(model.status);

    // ==========================================================
    // Debug
    // ==========================================================

    print("==========================================");
    print("EDIT PACKAGE");
    print("package/booking id = ${model.id}");
    print("customer id = $selectedCustomerId");
    print("customer name = ${customerNameController.text}");
    print("company rep name = ${companyResNameController.text}");
    print("technicians = $selectedTechnicianIds");
    print("technician names = $selectedTechnicianNames");
    print("start date = $startDate");
    print("end date = $endDate");
    print("time = $selectedTime");
    print("status = $selectedStatus");
    print("==========================================");
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    visitsNumberController.dispose();
    maintenanceDaysController.dispose();
    technicianController.dispose();
    customerNameController.dispose();
    companyResNameController.dispose();

    super.dispose();
  }

  // ============================================================
  // PICK START DATE
  // ============================================================

  Future<void> onPickStartDate() async {
    final picked = await pickDateFun(context);

    if (picked != null) {
      setState(() {
        startDate = picked;
      });
    }
  }

  // ============================================================
  // PICK END DATE
  // ============================================================

  Future<void> onPickEndDate() async {
    final picked = await pickDateFun(context);

    if (picked != null) {
      setState(() {
        endDate = picked;
      });
    }
  }

  // ============================================================
  // PICK TIME
  // ============================================================

  Future<void> onPickTime() async {
    final picked = await pickTimeFun(context);

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  // ============================================================
  // UPDATE PACKAGE
  // ============================================================

  void _updatePackage() {
    // ==========================================================
    // FORM VALIDATION
    // ==========================================================

    if (!_formKey.currentState!.validate()) {
      return;
    }

    // ==========================================================
    // CUSTOMER
    // ==========================================================

    if (selectedCustomerId == null) {
      showCustomSnackBar(
        context: context,
        message: "لازم تختار العميل",
        isSuccess: false,
      );

      return;
    }

    // ==========================================================
    // TECHNICIANS
    // ==========================================================

    if (selectedTechnicianIds.isEmpty) {
      showCustomSnackBar(
        context: context,
        message: "لازم تختار فني واحد على الأقل",
        isSuccess: false,
      );

      return;
    }

    // ==========================================================
    // TIME
    // ==========================================================

    if (selectedTime == null) {
      showCustomSnackBar(
        context: context,
        message: "لازم تختار الوقت",
        isSuccess: false,
      );

      return;
    }

    // ==========================================================
    // TIME FORMAT
    // ==========================================================

    final bookingTime =
        "${selectedTime!.hour.toString().padLeft(2, '0')}:"
        "${selectedTime!.minute.toString().padLeft(2, '0')}";

    // ==========================================================
    // VISITS COUNT
    // ==========================================================

    final visitsCount =
        int.tryParse(visitsNumberController.text.trim()) ??
        widget.model.visitCount ??
        0;

    // ==========================================================
    // MAINTENANCE DAYS
    //
    // Currently UserBookingEntity doesn't provide them.
    // Only send if user actually entered something.
    // ==========================================================

    final maintenanceDays = maintenanceDaysController.text
        .split("-")
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    // ==========================================================
    // COMPANY REPRESENTATIVE
    //
    // Current UserBookingEntity only has companyRepName.
    // Therefore companyRepId will remain null.
    // ==========================================================

    final companyName = companyResNameController.text.trim();

    final companyRepId = companyName.isEmpty ? null : selectedCompanyResId;

    // ==========================================================
    // UPDATE REQUEST
    // ==========================================================

    final request = UpdatePackageRequest(
      nameAr: selectedPackage,

      userId: selectedCustomerId,

      companyRepId: companyRepId,

      startDate: startDate.toIso8601String().split("T").first,

      endDate: endDate.toIso8601String().split("T").first,

      maintenanceDays: maintenanceDays,

      bookingTime: bookingTime,

      technicianIds: selectedTechnicianIds,

      visitsCount: visitsCount,

      serviceStatus: mapStatusToApi2(selectedStatus),

      // خليها حسب القيمة الموجودة عندك في الـ Request
      remindNextVisit: false,

      fieldsToSend: {
        'name_ar',
        'user_id',
        'company_rep_id',
        'start_date',
        'end_date',
        'maintenance_days',
        'booking_time',
        'technician_ids',
        'visits_count',
        'service_status',
        'remind_next_visit',
      },
    );

    // ==========================================================
    // DEBUG
    // ==========================================================

    print("==========================================");
    print("UPDATE PACKAGE");
    print("packageId = ${widget.model.id}");
    print("BODY = ${request.toJson()}");
    print("==========================================");

    // ==========================================================
    // CALL CUBIT
    // ==========================================================

    context.read<PackagesCubit>().updatePackage(
      packageId: widget.model.id,
      request: request,
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return BlocListener<PackagesCubit, PackagesState>(
      listener: (context, state) async {
        // ======================================================
        // SUCCESS
        // ======================================================

        if (state is UpdatePackageSuccess) {
          showCustomSnackBar(
            context: context,
            message: "تم تعديل الباقة بنجاح ✅",
            isSuccess: true,
          );

          await context.read<UserBookingCubit>().refresh();

          if (context.mounted) {
            context.pop(true);
          }
        }

        // ======================================================
        // ERROR
        // ======================================================

        if (state is UpdatePackageError) {
          showCustomSnackBar(
            context: context,
            message: state.message,
            isSuccess: false,
          );
          await context.read<UserBookingCubit>().refresh();
        }
      },

      child: Column(
        children: [
          // ====================================================
          // FORM
          // ====================================================
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddPackageForm(
                    formKey: _formKey,

                    // ==================================================
                    // CONTROLLERS
                    // ==================================================
                    visitsNumberController: visitsNumberController,

                    maintenanceDaysController: maintenanceDaysController,

                    technicianController: technicianController,

                    customerNameController: customerNameController,

                    companyResNameController: companyResNameController,

                    // ==================================================
                    // DATE
                    // ==================================================
                    startDate: startDate,
                    endDate: endDate,

                    // ==================================================
                    // TIME
                    // ==================================================
                    selectedTime: selectedTime,

                    // ==================================================
                    // INITIAL TECHNICIANS
                    // ==================================================
                    initialTechnicians: List.generate(
                      selectedTechnicianIds.length,
                      (index) {
                        return TechnicianItem(
                          id: selectedTechnicianIds[index],
                          name: selectedTechnicianNames[index],
                        );
                      },
                    ),

                    // ==================================================
                    // CUSTOMER
                    // ==================================================
                    onCustomerSelected: (id, name) {
                      setState(() {
                        selectedCustomerId = id;
                        customerNameController.text = name;
                      });

                      print("Selected Customer ID = $id");

                      print("Selected Customer Name = $name");
                    },

                    // ==================================================
                    // COMPANY REPRESENTATIVE
                    // ==================================================
                    onCompanyResSelected: (id, name) {
                      setState(() {
                        selectedCompanyResId = id;
                        companyResNameController.text = name;
                      });

                      print("Selected Company ID = $id");

                      print("Selected Company Name = $name");
                    },

                    // ==================================================
                    // TECHNICIANS
                    // ==================================================
                    onTechniciansSelected: (techs) {
                      setState(() {
                        selectedTechnicianIds = techs.map((e) => e.id).toList();

                        selectedTechnicianNames = techs
                            .map((e) => e.name)
                            .toList();

                        technicianController.text = selectedTechnicianNames
                            .join(" - ");
                      });

                      print(
                        "Selected Technicians = "
                        "$selectedTechnicianIds",
                      );
                    },

                    // ==================================================
                    // PACKAGE
                    // ==================================================
                    selectedPackage: selectedPackage,

                    onPackageChanged: (value) {
                      if (value == null) {
                        return;
                      }

                      setState(() {
                        selectedPackage = value;
                      });
                    },

                    // ==================================================
                    // DATE CALLBACKS
                    // ==================================================
                    onPickStartDate: onPickStartDate,

                    onPickEndDate: onPickEndDate,

                    // ==================================================
                    // TIME CALLBACK
                    // ==================================================
                    onPickTime: onPickTime,
                  ),

                  // ==================================================
                  // STATUS
                  // ==================================================
                  const FieldLabel('حالة الخدمة'),

                  StatusSelector<RequestStatus>(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.h(12),
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

                  // ==================================================
                  // VISITS CHECK
                  // ==================================================
                
                  SizedBox(height: SizeConfig.h(40)),
                ],
              ),
            ),
          ),

          // ====================================================
          // FOOTER
          // ====================================================
          BlocBuilder<PackagesCubit, PackagesState>(
            builder: (context, state) {
              final isLoading = state is UpdatePackageLoading;

              return AddEditOfferViewFooter(
                text: isLoading ? "جاري الحفظ..." : "حفظ",
                onPressed: isLoading ? null : _updatePackage,
              );
            },
          ),
        ],
      ),
    );
  }
}
