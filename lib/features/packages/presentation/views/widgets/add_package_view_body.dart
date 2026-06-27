import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/functions/pick_time_fun.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/packages/data/models/create_package_request.dart';
import 'package:plupool/features/packages/presentation/manager/package_cubit/package_cubit.dart';
import 'package:plupool/features/packages/presentation/manager/package_cubit/package_state.dart';
import 'package:plupool/features/packages/presentation/views/widgets/add_package_form.dart';

class AddPackageViewBody extends StatefulWidget {
  const AddPackageViewBody({super.key});

  @override
  State<AddPackageViewBody> createState() => _AddPackageViewBodyState();
}

class _AddPackageViewBodyState extends State<AddPackageViewBody> {
  final _formKey = GlobalKey<FormState>();

  final visitsNumberController = TextEditingController();
  final maintenanceDaysController = TextEditingController();
  final technicianController = TextEditingController();
  final customerNameController = TextEditingController();

  int? selectedCustomerId;
  List<int> selectedTechnicianIds = [];

  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? selectedTime;

  String selectedPackage = "الباقه الشهريه";

  @override
  void dispose() {
    visitsNumberController.dispose();
    maintenanceDaysController.dispose();
    technicianController.dispose();
    customerNameController.dispose();
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

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    if (selectedCustomerId == null) {
      showCustomSnackBar(
        context: context,
        message: "اختر العميل",
      );
      return;
    }

    if (selectedTechnicianIds.isEmpty) {
      showCustomSnackBar(
        context: context,
        message: "اختر فني واحد على الأقل",
      );
      return;
    }

    if (startDate == null ||
        endDate == null ||
        selectedTime == null) {
      showCustomSnackBar(
        context: context,
        message: "اختر التاريخ والوقت",
      );
      return;
    }

    context.read<PackagesCubit>().addPackage(
          CreatePackageRequest(
            nameAr: selectedPackage,
            nameEn: selectedPackage,
            descriptionAr: "",
            price: 0,
            duration: "MONTHLY",
            visitsCount: int.parse(visitsNumberController.text),
            reminderDaysBefore: 3,
            isActive: true,
            userId: selectedCustomerId!,
            startDate: startDate!.toString(),
            endDate: endDate.toString(),
            maintenanceDays:
                maintenanceDaysController.text.split(","),
            bookingTime:
                "${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}",
            technicianIds: selectedTechnicianIds,
            serviceStatus: "scheduled",
            remindNextVisit: false,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PackagesCubit, PackagesState>(
      listener: (context, state) {
        if (state is PackagesActionSuccess) {
          showCustomSnackBar(
            context: context,
            message: "تم إضافة الباقة بنجاح",
            isSuccess: true,
          );

          Navigator.pop(context);
        }

        if (state is PackagesActionError) {
          showCustomSnackBar(
            context: context,
            message: state.message,
          );
        }
      },
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: AddPackageForm(
                formKey: _formKey,
                visitsNumberController: visitsNumberController,
                maintenanceDaysController:
                    maintenanceDaysController,
                technicianController: technicianController,
                customerNameController:
                    customerNameController,
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

                /// العميل
                onCustomerSelected: (id, name) {
                  selectedCustomerId = id;
                  customerNameController.text = name;
                },

                /// الفنيين
                onTechniciansSelected: (techs) {
                  selectedTechnicianIds =
                      techs.map((e) => e.id).toList();
                },

                initialTechnicians: const [],
              ),
            ),
          ),

          BlocBuilder<PackagesCubit, PackagesState>(
            builder: (context, state) {
              final isLoading = state is PackagesActionLoading;

              return AddEditOfferViewFooter(
                text: isLoading ? "جاري الإضافة..." : "إضافة",
                onPressed: isLoading ? null : _submit,
              );
            },
          ),
        ],
      ),
    );
  }
}