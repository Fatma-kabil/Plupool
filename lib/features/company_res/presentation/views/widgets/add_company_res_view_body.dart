import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/company_res/presentation/views/widgets/add-company_form.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/uers_cubit.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/users_state.dart';

class AddCompanyResViewBody extends StatefulWidget {
  const AddCompanyResViewBody({super.key});

  @override
  State<AddCompanyResViewBody> createState() => _AddCompanyResViewBodyState();
}

class _AddCompanyResViewBodyState extends State<AddCompanyResViewBody> {
  late final TextEditingController nameController;
  late final TextEditingController companyController;
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
    companyController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    companyController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersCubit, UsersState>(
      listener: (context, state) {
        if (state is UsersActionSuccess) {
          showCustomSnackBar(
            context: context,
            message: "تم إضافة الشركة بنجاح",
            isSuccess: true,
          );

          Navigator.pop(context);
        }

        if (state is UsersActionError) {
          showCustomSnackBar(context: context, message: state.message);
        }
      },

      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(6)),

          child: Column(
            children: [
              AddCompanyForm(
                formKey: formKey,
                nameController: nameController,
                companyController: companyController,
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
                text: state is UsersActionLoading ? "جارى الإضافة..." : "إضافة",

                width: double.infinity,

                padding: SizeConfig.h(7),

                textStyle: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: Colors.white),

                trailing: state is UsersActionLoading
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
                        size: SizeConfig.w(SizeConfig.isWideScreen ? 20 : 24),
                      ),

                onPressed: state is UsersActionLoading
                    ? null
                    : () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }

                        context.read<UsersCubit>().addUser(
                          fullName: nameController.text.trim(),

                          companyName: companyController.text.trim(),

                          phone: phoneController.text.trim(),

                          countryCode: selectedCountryCode,

                          role: "company",

                          isActive: isActive,

                          isApproved: true,

                          isPhoneVerified: true,
                        );
                      },
              ),

              SizedBox(height: SizeConfig.h(15)),

              CustomOutlinedBtn(
                text: "إلغاء",

                width: double.infinity,

                trailing: Icon(
                  Icons.cancel_outlined,

                  color: AppColors.kprimarycolor,

                  size: SizeConfig.w(SizeConfig.isWideScreen ? 20 : 24),
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
