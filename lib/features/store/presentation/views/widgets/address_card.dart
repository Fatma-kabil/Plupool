import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/get_country_by_code.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/functions/split_phone.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_form_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';
import 'package:plupool/features/profile/domain/entities/user_entity.dart';

class AddressCard extends StatefulWidget {
  const AddressCard({
    super.key,
    required this.user,
    required this.addressController,
    required this.phoneController,
    required this.selectedCountryCode,
    required this.onCountryChanged,
  });

  final UserEntity user;

  final TextEditingController addressController;
  final TextEditingController phoneController;

  final String selectedCountryCode;
  final ValueChanged<String> onCountryChanged;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  bool isEditing = false;

  @override
  void initState() {
    super.initState();

    final phoneData = splitPhone2(widget.user.phone);

    if (widget.addressController.text.isEmpty) {
      widget.addressController.text = widget.user.address;
    }

    if (widget.phoneController.text.isEmpty) {
      widget.phoneController.text = normalizeArabicNumbers(phoneData.number);
    }
  }

  @override
  Widget build(BuildContext context) {
    final iso = countryCodeFromDialCode(widget.selectedCountryCode) ?? 'EG';

    final selectedCountryFlag = flagEmojiFromIso(iso);

    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(15)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(15),
        vertical: SizeConfig.h(15),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffCCE4F0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Text(
                "العنوان ورقم الهاتف",
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: const Color(0xff333333)),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isEditing = !isEditing;
                  });
                },
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      "تعديل",
                      style: AppTextStyles.styleSemiBold15(context),
                    ),
                    SizedBox(width: SizeConfig.w(4)),
                    Icon(
                      Icons.edit_note,
                      color: AppColors.kprimarycolor,
                      size: SizeConfig.w(20),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: SizeConfig.h(12)),

          if (!isEditing) ...[
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.kprimarycolor,
                  size: SizeConfig.w(17),
                ),
                SizedBox(width: SizeConfig.w(4)),
                Expanded(
                  child: Text(
                    widget.addressController.text,
                    style: AppTextStyles.styleRegular13(
                      context,
                    ).copyWith(color: const Color(0xff777777)),
                  ),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(6)),

            Row(
              textDirection: TextDirection.rtl,
              children: [
                Icon(
                  Icons.phone_rounded,
                  color: AppColors.kprimarycolor,
                  size: SizeConfig.w(15),
                ),
                SizedBox(width: SizeConfig.w(4)),
                Align(
                  alignment: Alignment.centerRight,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: RichText(
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                        style: AppTextStyles.styleRegular16(
                          context,
                        ).copyWith(color: const Color(0xff777777)),
                        children: [
                          const TextSpan(text: '+'),
                          const TextSpan(text: ' '),
                          TextSpan(
                            text: reverseNumbers(
                              toArabicNumbers(
                                getCountryCodeDigits(
                                  widget.selectedCountryCode,
                                ),
                              ),
                            ),
                          ),
                          const TextSpan(text: ' '),
                          TextSpan(
                            text: reverseNumbers(
                              toArabicNumbers(widget.phoneController.text),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ] else ...[
            SizedBox(height: SizeConfig.h(10)),

            Text(
              "مكان الإقامة",
              textDirection: TextDirection.rtl,
              style: AppTextStyles.styleRegular13(
                context,
              ).copyWith(color: const Color(0xff555555)),
            ),

            SizedBox(height: SizeConfig.h(6)),

            CustomTextFormField(
              bordercolor: Color(0xff777777),
              iconColor: AppColors.kprimarycolor,
              controller: widget.addressController,
              hintText: "العنوان",
              icon: Icons.location_on_outlined,
            ),

            SizedBox(height: SizeConfig.h(15)),

            Text(
              "رقم الهاتف",
              textDirection: TextDirection.rtl,
              style: AppTextStyles.styleRegular13(
                context,
              ).copyWith(color: const Color(0xff555555)),
            ),

            SizedBox(height: SizeConfig.h(6)),
            PhoneInputField(
              controller: widget.phoneController,
              iconcolor: AppColors.kprimarycolor,
              bordercolor:Color(0xff777777),
              initialCountryCode: widget.selectedCountryCode,
              initialCountryFlag: selectedCountryFlag,
              onCountryChanged: (code, flag) {
                widget.onCountryChanged(code);
              },
            ),

            SizedBox(height: SizeConfig.h(12)),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      isEditing = false;
                    });
                  },
                  child: Text(
                    "حفظ",
                    style: AppTextStyles.styleRegular16(
                      context,
                    ).copyWith(color: AppColors.kprimarycolor),
                  ),
                ),
                SizedBox(width: SizeConfig.w(8)),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isEditing = false;
                    });
                  },
                  child: Text(
                    "إلغاء",
                    style: AppTextStyles.styleRegular16(
                      context,
                    ).copyWith(color: AppColors.kprimarycolor),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
