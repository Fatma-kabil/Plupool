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

class UpdateCompanyInfo extends StatefulWidget {
  const UpdateCompanyInfo({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  State<UpdateCompanyInfo> createState() => UpdateCompanyInfoState();
}

class UpdateCompanyInfoState extends State<UpdateCompanyInfo> {
  final GlobalKey<PhoneInputFieldState> _phoneFieldKey =
      GlobalKey<PhoneInputFieldState>();

  late TextEditingController nameController;
  late TextEditingController phoneController;

  String selectedCountryCode = '+20';

  @override
  void initState() {
    super.initState();

    // =========================
    // الاسم
    // =========================
    nameController = TextEditingController(
      text: widget.user.fullName,
    );

    // =========================
    // رقم الهاتف
    // =========================
    final phoneData = splitPhone(widget.user.phone);

    selectedCountryCode = phoneData.countryCode.isNotEmpty
        ? phoneData.countryCode
        : '+20';

    phoneController = TextEditingController(
      text: phoneData.number,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  /// تجهيز البيانات التي سيتم إرسالها للـ API
  UpdateUserModel getUpdateUserModel() {
    return UpdateUserModel(
      // الاسم
      fullName: nameController.text.trim(),

      // رقم الهاتف كامل مع Country Code
      phone: mergePhone(
        countryCode: selectedCountryCode,
        number: phoneController.text.trim(),
      ),

      // Role
      role: 'company',

      // الحقول غير المستخدمة للشركة
      profileImage: null,
      latitude: null,
      longitude: null,
      address: null,
      skills: null,
      yearsOfExperience: null,
      email: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    // =========================
    // Country Code → ISO
    // =========================
    final iso =
        countryCodeFromDialCode(selectedCountryCode) ?? 'EG';

    // =========================
    // Flag
    // =========================
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // =========================
          // الاسم
          // =========================
          Text(
            'الاسم',
            textDirection: TextDirection.rtl,
            style: AppTextStyles.styleMedium16(context).copyWith(
              color: const Color(0xff555555),
            ),
          ),

          SizedBox(height: SizeConfig.h(6)),

          CustomTextFormField(
            controller: nameController,
            hintText: 'ادخل اسمك',
            icon: Icons.person_2_outlined,
            validator: (v) => Validators.name(v),
          ),

          SizedBox(height: SizeConfig.h(15)),

          // =========================
          // رقم الهاتف
          // =========================
          Text(
            'رقم الهاتف',
            textDirection: TextDirection.rtl,
            style: AppTextStyles.styleMedium16(context).copyWith(
              color: const Color(0xff555555),
            ),
          ),

          SizedBox(height: SizeConfig.h(6)),

          PhoneInputField(
            key: _phoneFieldKey,
            controller: phoneController,
            validator: (v) => Validators.phone(v),

            // Country Code
            initialCountryCode: selectedCountryCode,

            // Flag
            initialCountryFlag: flag,

            // تغيير الدولة
            onCountryChanged: (code, selectedFlag) {
              setState(() {
                selectedCountryCode = code;
              });
            },
          ),

          SizedBox(height: SizeConfig.h(10)),
        ],
      ),
    );
  }
}