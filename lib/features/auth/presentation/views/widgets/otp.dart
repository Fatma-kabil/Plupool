import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class Otp extends StatefulWidget {
  final void Function(String) onCompleted;

  const Otp({super.key, required this.onCompleted});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final int codeLength = 6;
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(codeLength, (_) => TextEditingController());
    focusNodes = List.generate(codeLength, (_) => FocusNode());

    for (var node in focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNodes.first);
    });
  }

  String get otpCode => controllers.map((c) => c.text).join();

  @override
  void dispose() {
    for (var c in controllers) c.dispose();
    for (var f in focusNodes) f.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(codeLength, (index) {
        final isFocused = focusNodes[index].hasFocus;

        return SizedBox(
          width: SizeConfig.w(49),
          height: SizeConfig.h(51),
          child: TextField(
                     //   cursorHeight:SizeConfig.isWideScreen?SizeConfig.w(7): SizeConfig.h(5),
            cursorColor: AppColors.kprimarycolor,

            controller: controllers[index],
            focusNode: focusNodes[index],
            textAlign: TextAlign.center,
            maxLength: 1,
            keyboardType: TextInputType.number,
            style: AppTextStyles.styleMedium25(context),
            decoration: InputDecoration(
              counterText: "",
              filled: true,
              fillColor: isFocused ? const Color(0xffE9F9FC) : AppColors.kScaffoldColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.kprimarycolor, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.kprimarycolor, width: 1.5),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty && index < codeLength - 1) {
                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).requestFocus(focusNodes[index - 1]);
              }
              widget.onCompleted(otpCode); // 🔹 نرسل الكود بعد كل تغيير
            },
          ),
        );
      }),
    );
  }
}
