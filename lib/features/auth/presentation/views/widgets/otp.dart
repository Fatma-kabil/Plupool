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
  final int codeLength = 5;
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(codeLength, (_) => TextEditingController());
    focusNodes = List.generate(codeLength, (_) => FocusNode());

    // 👇 هنا السحر
    // نضيف Listener لكل FocusNode عشان يعمل إعادة بناء عند أي تغيير
    for (var node in focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }

    // نخلي أول خانة تاخد focus لما الصفحة تفتح
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNodes.first);
    });
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(codeLength, (index) {
        final isFocused = focusNodes[index].hasFocus;

        return SizedBox(
          width: SizeConfig.w(49),
          height: SizeConfig.h(51),
          child: TextField(
            cursorColor: AppColors.kprimarycolor,
            controller: controllers[index],
            focusNode: focusNodes[index],
            textAlign: TextAlign.center,
            maxLength: 1,
            keyboardType: TextInputType.number,
            style: AppTextStyles.styleMedium25(context),
            decoration: InputDecoration(
              counterText: "",
              contentPadding: EdgeInsets.zero,
              filled: true,
              fillColor: isFocused
                  ? Color(0xffE9F9FC)
                  : AppColors.kScaffoldColor, //, الخلفية لو عليه الدور

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: AppColors.kprimarycolor,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: AppColors.kprimarycolor,
                  width: 1.5,
                ),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty && index < codeLength - 1) {
                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).requestFocus(focusNodes[index - 1]);
              }
            },
          ),
        );
      }),
    );
  }
}
