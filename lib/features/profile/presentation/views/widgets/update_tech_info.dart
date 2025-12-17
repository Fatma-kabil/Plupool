import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/get_country_by_code.dart';
import 'package:plupool/core/utils/functions/split_phone.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/custom_text_form_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';
import 'package:plupool/features/profile/data/models/update_user_model.dart';
import 'package:plupool/features/profile/domain/entities/user_entity.dart';

class UpdateTechInfo extends StatefulWidget {
  const UpdateTechInfo({super.key, required this.user});
  final UserEntity user;

  @override
  State<UpdateTechInfo> createState() => UpdateTechInfoState();
}

class UpdateTechInfoState extends State<UpdateTechInfo> {
  final GlobalKey<PhoneInputFieldState> _phoneFieldKey =
      GlobalKey<PhoneInputFieldState>();

  late TextEditingController nameController;
  late TextEditingController locationController;
  late TextEditingController skillsController;
  late TextEditingController expController;
  late TextEditingController phoneController;

  String selectedCountryCode = '+20'; // القيمة الافتراضية

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.user.fullName);
    locationController = TextEditingController(text: widget.user.address);
    skillsController = TextEditingController(text: widget.user.skills);
    expController =
        TextEditingController(text: widget.user.yearsOfExperience.toString());

    final phoneData = splitPhone(widget.user.phone);
    selectedCountryCode =
        phoneData.countryCode.isNotEmpty ? phoneData.countryCode : '+20';
    phoneController = TextEditingController(text: phoneData.number);
  }

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    skillsController.dispose();
    expController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  UpdateUserModel getUpdateUserModel() {
    return UpdateUserModel(
      fullName: nameController.text,
      phone: mergePhone(
        countryCode: selectedCountryCode,
        number: phoneController.text,
      ),
      address: locationController.text,
      skills: skillsController.text,
      yearsOfExperience: int.tryParse(expController.text) ?? 0,
      role: 'technician',
      profileImage: null,
      latitude: null,
      longitude: null,
      email: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    // تحويل كود الدولة لـ ISO لعرض العلم
    final iso = countryCodeFromDialCode(selectedCountryCode) ?? 'EG';
    final flag = flagEmojiFromIso(iso);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: SizeConfig.h(20),
        bottom: SizeConfig.h(20),
        right: SizeConfig.w(12),
        left: SizeConfig.w(12),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // الاسم
          Text(
            'الاسم',
            style: AppTextStyles.styleMedium16(context)
                .copyWith(color: const Color(0xff555555)),
          ),
          SizedBox(height: SizeConfig.h(6)),
          CustomTextFormField(
            controller: nameController,
            hintText: 'ادخل اسمك',
            icon: Icons.person_2_outlined,
            validator: (v) => Validators.name(v),
          ),
          SizedBox(height: SizeConfig.h(15)),

          // مكان الإقامة
          Text(
            'مكان الإقامة',
            style: AppTextStyles.styleMedium16(context)
                .copyWith(color: const Color(0xff555555)),
          ),
          SizedBox(height: SizeConfig.h(6)),
          CustomTextFormField(
            controller: locationController,
            hintText: 'ادخل مكان الإقامة',
            icon: Icons.location_on_outlined,
            validator: (v) =>
                Validators.required(v, fieldName: 'مكان الإقامة'),
          ),
          SizedBox(height: SizeConfig.h(15)),

          // المهارات
          Text(
            'المهارات',
            style: AppTextStyles.styleMedium16(context)
                .copyWith(color: const Color(0xff555555)),
          ),
          SizedBox(height: SizeConfig.h(6)),
          CustomTextFormField(
            controller: skillsController,
            hintText: 'أدخل مهاراتك مفصولة بفاصلة',
            icon: Icons.build_outlined,
            validator: (v) => Validators.required(v),
          ),
          SizedBox(height: SizeConfig.h(15)),

          // سنوات الخبرة
          Text(
            'عدد سنين الخبرة',
            style: AppTextStyles.styleMedium16(context)
                .copyWith(color: const Color(0xff555555)),
          ),
          SizedBox(height: SizeConfig.h(6)),
          CustomTextFormField(
            controller: expController,
            hintText: 'أدخل عدد سنين خبرتك',
            icon: Icons.work_history_outlined,
            keyboardType: TextInputType.number,
            validator: (v) => Validators.required(v),
          ),
          SizedBox(height: SizeConfig.h(15)),

          // رقم الهاتف
          Text(
            'رقم الهاتف',
            style: AppTextStyles.styleMedium16(context)
                .copyWith(color: const Color(0xff555555)),
          ),
          SizedBox(height: SizeConfig.h(6)),
          PhoneInputField(
            key: _phoneFieldKey,
            controller: phoneController,
            validator: (v) => Validators.phone(v),
            initialCountryCode: selectedCountryCode,
            initialCountryFlag: flag,
            onCountryChanged: (code, selectedFlag) {
              setState(() {
                selectedCountryCode = code;
              });
            },
          ),
        ],
      ),
    );
  }
}
