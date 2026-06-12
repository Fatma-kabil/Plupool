import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/get_country_by_code.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/customers/domain/entities/user_entity.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/uers_cubit.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/users_state.dart';
import 'package:plupool/features/technicains/presentation/views/widgets/edit_add_tech_form.dart';

class EditTechViewBody extends StatefulWidget {
  const EditTechViewBody({super.key, required this.user});

  final UserEntity user;

  @override
  State<EditTechViewBody> createState() => _EditTechViewBodyState();
}

class _EditTechViewBodyState extends State<EditTechViewBody> {
  late final TextEditingController nameController;

  late final TextEditingController locationController;

  late final TextEditingController phoneController;

  late final TextEditingController skillsController;

  late final TextEditingController noOfYearsController;

  final phoneFieldKey = GlobalKey<FormFieldState>();

  late String selectedCountryCode;

  late String selectedCountryFlag;

  late bool isActive;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.user.fullName);

    locationController = TextEditingController(text: widget.user.address ?? "");

    skillsController = TextEditingController(text: widget.user.skills ?? "");

    noOfYearsController = TextEditingController(
      text: widget.user.yearsOfExperience?.toString() ?? "",
    );

    selectedCountryCode = widget.user.countryCode;

    selectedCountryFlag = flagEmojiFromIso(
      countryCodeFromDialCode(selectedCountryCode) ?? 'EG',
    );

    phoneController = TextEditingController(
      text: widget.user.phone.replaceFirst(selectedCountryCode, ''),
    );

    isActive = widget.user.isActive;
  }

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    phoneController.dispose();
    skillsController.dispose();
    noOfYearsController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersCubit, UsersState>(
      listener: (context, state) {
        if (state is UsersActionSuccess) {
          showCustomSnackBar(
            context: context,
            message: 'تم تعديل الفني بنجاح',
            isSuccess: true,
          );

          Navigator.pop(context);

          context.read<UsersCubit>().getUserDetails(widget.user.id);
        }

        if (state is UsersActionError) {
          showCustomSnackBar(context: context, message: state.message);

          context.read<UsersCubit>().getUserDetails(widget.user.id);
        }
      },

      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(6)),

          child: SingleChildScrollView(
            child: Column(
              children: [
                EditAddTechForm(
                  formKey: formKey,
                  nameController: nameController,

                  skillsController: skillsController,

                  noOfYearsController: noOfYearsController,

                  phoneFieldKey: phoneFieldKey,

                  phoneController: phoneController,

                  locationController: locationController,

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

                SizedBox(height: 40),

                CustomTextBtn(
                  text: state is UsersActionLoading
                      ? "جارى التعديل..."
                      : "تعديل",

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
                          context.read<UsersCubit>().updateUser(
                            userId: widget.user.id,

                            fullName: nameController.text,

                            address: locationController.text,

                            phone: phoneController.text,

                            countryCode: selectedCountryCode,

                            skills: skillsController.text,

                            yearsOfExperience: int.tryParse(
                              noOfYearsController.text,
                            ),

                            isActive: isActive,
                          );
                        },
                ),

                SizedBox(height: SizeConfig.h(15)),

                CustomOutlinedBtn(
                  text: " إلغاء",

                  width: double.infinity,

                  trailing: Icon(
                    Icons.cancel_outlined,

                    color: AppColors.kprimarycolor,

                    size: SizeConfig.w(SizeConfig.isWideScreen ? 20 : 24),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
