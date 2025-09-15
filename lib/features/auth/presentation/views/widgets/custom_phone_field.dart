import 'package:flutter/material.dart';

import 'package:nation_code_picker/nation_code_picker.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomPhoneField extends StatefulWidget {
  const CustomPhoneField({super.key, required this.controller, this.validator});
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  NationCodes _selectedNationCode = NationCodes.eg; // افتراضي مصر
  


  @override
  Widget build(BuildContext context) {
  
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
        //  color:textFieldColor ,
        //  border: Border.all(color: textFieldBorderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              // 📞 أيقونة قبل العلم
              Transform.rotate(
                angle: 1.5708, // راديان = 90 درجة (لتحت)
                child: Icon(
                  Icons.arrow_back_ios,
                  size: SizeConfig.h(12),
                  weight: 120,
                ),
              ),
          
              const SizedBox(width: 6),
          
              // 🌍 العلم + السهم بس
              NationCodePicker(
                defaultNationCode: _selectedNationCode,
                hideDialCode: true,
                onNationSelected: (nation) {
                  setState(() {
                    _selectedNationCode = nation;
                  });
                },
              ),
          
              // | خط عمودي
              Container(
                width: 1,
             //   height: 28,
                color: Colors.grey,
                margin: const EdgeInsets.symmetric(horizontal: 8),
              ),
          
              // 📱 TextField فيه الكود + الرقم
              Expanded(
                child: TextFormField(
                  cursorColor: Colors.black,
                    controller:widget.controller,
                     validator:widget.validator,
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.right,
                  
                  decoration: InputDecoration(
                 
                    border: InputBorder.none,
                    hintText:  " 010-98776554(${_selectedNationCode.dialCode})",                    // ✅ هنا هنضيف الكود
                   hintStyle: AppTextStyles.styleRegular16(context).copyWith(fontSize:SizeConfig.isWideScreen?25: 14,color:  Color(0xff6C7278),)
                  ),
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
