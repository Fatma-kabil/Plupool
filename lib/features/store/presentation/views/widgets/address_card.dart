import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_form_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';

class AddressCard extends StatefulWidget {
  const AddressCard({super.key});

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  bool isEditing = false;

  final addressController = TextEditingController(
    text: "شارع الجمهورية، الدور الثالث، شقة 12، القاهرة",
  );
  final phoneController = TextEditingController(text: "+20 123 456 7890");

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(15)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(15),
        vertical: SizeConfig.h(15),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffCCE4F0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// ---------- Header ----------
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Text(
                "العنوان ورقم الهاتف",
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: Color(0xff333333)),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isEditing = !isEditing;
                  });
                  if (isEditing) {
                    phoneController.text = phoneController.text
                        .replaceFirst("+2", "")
                        .trim();
                  }
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

          /// ---------- Content ----------
          if (!isEditing) ...[
            // ----------- View Mode -----------
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.kprimarycolor,
                  size: SizeConfig.w(17),
                ),
                SizedBox(width: SizeConfig.w(4)),
                Text(
                  addressController.text,
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: Color(0xff777777)),
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
                  size: SizeConfig.w(17),
                ),
                SizedBox(width: SizeConfig.w(4)),
                Text(
                  phoneController.text,
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: Color(0xff777777)),
                ),
              ],
            ),
          ] else ...[
            // ----------- Edit Mode (Forms)-----------
            SizedBox(height: SizeConfig.h(10)),
            Text(
              textDirection: TextDirection.rtl,
              "مكان الإقامة",
              style: AppTextStyles.styleRegular13(
                context,
              ).copyWith(color: Color(0xff555555)),
            ),
            SizedBox(height: SizeConfig.h(6)),
            CustomTextFormField(
              iconColor: AppColors.kprimarycolor,
              controller: addressController,
              hintText: "العنوان",
              icon: Icons.location_on_outlined,
            ),

            SizedBox(height: SizeConfig.h(15)),
            Text(
              textDirection: TextDirection.rtl,
              "رقم الهاتف",
              style: AppTextStyles.styleRegular13(
                context,
              ).copyWith(color: Color(0xff555555)),
            ),
            SizedBox(height: SizeConfig.h(6)),
            PhoneInputField(controller: phoneController,iconcolor: AppColors.kprimarycolor,),

            SizedBox(height: SizeConfig.h(12)),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                TextButton(
                  onPressed: () {},
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
