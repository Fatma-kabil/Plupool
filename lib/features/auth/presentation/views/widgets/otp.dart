import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
   final int codeLength = 4;
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(codeLength, (_) => TextEditingController());
    focusNodes = List.generate(codeLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(49),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          codeLength,
          (index) => SizedBox(
            width: SizeConfig.w(66),
            height: SizeConfig.h(56),
            child: TextField(
              cursorColor: AppColors.kprimarycolor,
              controller: controllers[index],
              focusNode: focusNodes[index],
              textAlign: TextAlign.center,
              maxLength: 1,
              keyboardType: TextInputType.number,
              style: AppTextStyles.styleMedium25(context),
              decoration: InputDecoration(
                counterText: "", // يخفي عداد الأحرف
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: AppColors.ktextcolor, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: AppColors.kprimarycolor, width: 2), // 👈 border أزرق عند التركيز
                ),
               
              ),
              onChanged: (value) {
                if (value.isNotEmpty && index < codeLength - 1) {
                  // يروح لللي بعده
                  FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                } else if (value.isEmpty && index > 0) {
                  // لو مسح يرجع للخانة اللي قبلها
                  FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}