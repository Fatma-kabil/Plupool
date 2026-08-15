import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/company_res/presentation/manager/cubits/company_res_clients_cubit/company_res_clients_state.dart';
import 'package:plupool/features/company_res/presentation/manager/cubits/company_res_clients_cubit/company_rs_clients_cubit.dart';
import 'package:plupool/features/customers/presentation/views/widgets/add_edit_customer_form.dart';

class AddCompanyResClientViewBody extends StatefulWidget {
  const AddCompanyResClientViewBody({super.key, required this.companyRepId});

  final int companyRepId;

  @override
  State<AddCompanyResClientViewBody> createState() =>
      _AddCompanyResClientViewBodyState();
}

class _AddCompanyResClientViewBodyState
    extends State<AddCompanyResClientViewBody> {
  late final TextEditingController nameController;
  late final TextEditingController locationController;
  late final TextEditingController phoneController;

  final formKey = GlobalKey<FormState>();
  final phoneFieldKey = GlobalKey<FormFieldState>();

  String selectedCountryCode = "+20";
  String selectedCountryFlag = "🇪🇬";

  bool isActive = true;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    locationController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<CompanyResClientsCubit, CompanyResClientsState>(
  listenWhen: (previous, current) {
    // نجاح جديد
    if (previous.createdClient == null &&
        current.createdClient != null) {
      return true;
    }

    // Error جديد
    if (previous.createError == null &&
        current.createError != null) {
      return true;
    }

    return false;
  },

  listener: (context, state) {
    // =========================
    // CREATE SUCCESS
    // =========================
    if (state.createdClient != null) {
      showCustomSnackBar(
        context: context,
        message: "تم إضافة العميل بنجاح",
        isSuccess: true,
      );

      Navigator.pop(context);
      return;
    }

    // =========================
    // CREATE ERROR
    // =========================
    if (state.createError != null) {
      showCustomSnackBar(
        context: context,
        message: state.createError!,
      );
    }
  },

  builder: (context, state) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(6),
      ),
      child: Column(
        children: [
          AddEditCustomerForm(
            formKey: formKey,
            locationController: locationController,
            nameController: nameController,
            phoneFieldKey: phoneFieldKey,
            phoneController: phoneController,
            initialCountryCode: selectedCountryCode,
            initialCountryFlag: selectedCountryFlag,
            onCountryChanged: (code, flag) {
              selectedCountryCode = code;
              selectedCountryFlag = flag;
            },
            isActive: isActive,
            onActiveChanged: (value) {
              setState(() {
                isActive = value;
              });
            },
          ),

          CustomTextBtn(
            text: state.isCreating
                ? "جارى الإضافة..."
                : "إضافة العميل",

            width: double.infinity,

            padding: SizeConfig.h(7),

            textStyle: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(
              color: Colors.white,
            ),

            trailing: state.isCreating
                ? SizedBox(
                    width: SizeConfig.w(18),
                    height: SizeConfig.w(18),
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Icon(
                    Icons.person_add_alt_1,
                    color: Colors.white,
                    size: SizeConfig.w(24),
                  ),

            onPressed: state.isCreating
                ? null
                : () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }

                    context
                        .read<CompanyResClientsCubit>()
                        .createClient(
                          companyRepId: widget.companyRepId,
                          fullName: nameController.text.trim(),
                          phone: phoneController.text.trim(),
                          countryCode: selectedCountryCode,
                          address: locationController.text.trim(),
                          isActive: isActive,
                        );
                  },
          ),

          SizedBox(
            height: SizeConfig.h(15),
          ),

          CustomOutlinedBtn(
            text: "إلغاء",
            width: double.infinity,
            trailing: Icon(
              Icons.cancel_outlined,
              color: AppColors.kprimarycolor,
              size: SizeConfig.w(24),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  },
);
  }
}
