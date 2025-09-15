import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';

class PasswordRecoveryRow extends StatefulWidget {
  const PasswordRecoveryRow({super.key});

  @override
  State<PasswordRecoveryRow> createState() => _PasswordRecoveryRowState();
}

class _PasswordRecoveryRowState extends State<PasswordRecoveryRow> {
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
        horizontal: SizeConfig.isWideScreen ? SizeConfig.w(30) : SizeConfig.w(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          codeLength,
          (index) => SizedBox(
            width: SizeConfig.w(66),
            height: SizeConfig.h(56),
            child: TextField(
            //  cursorColor: buttonColor,
              controller: controllers[index],
              focusNode: focusNodes[index],
              textAlign: TextAlign.center,
              maxLength: 1,
              keyboardType: TextInputType.number,
            //  style: AppTextStyles.styleBold26(context),
              decoration: InputDecoration(
                counterText: "", // يخفي عداد الأحرف
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
              //    borderSide: BorderSide(color: textFieldBorderColor, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
               //   borderSide: BorderSide(color: buttonColor, width: 2), // 👈 border أزرق عند التركيز
                ),
                filled: true,
              //  fillColor: textFieldColor,
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
