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

    for (final node in focusNodes) {
      node.addListener(() => setState(() {}));
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNodes.first);
    });
  }

  String get otpCode => controllers.map((c) => c.text).join();

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(codeLength, (index) {
          final isFocused = focusNodes[index].hasFocus;

          return Padding(
            padding: EdgeInsets.only(
              right: index == codeLength - 1 ? 0 : SizeConfig.w(4),
            ),
            child: SizedBox(
              width: SizeConfig.w(49),
              height: SizeConfig.h(51),
              child: TextField(
                controller: controllers[index],
                focusNode: focusNodes[index],
                keyboardType: TextInputType.number,
                maxLength: 1,
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
                cursorColor: AppColors.kprimarycolor,
                style: AppTextStyles.styleMedium25(context),
                decoration: InputDecoration(
                  counterText: "",
                  filled: true,
                  fillColor: isFocused
                      ? const Color(0xffE9F9FC)
                      : AppColors.kScaffoldColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.kprimarycolor,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
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

                  widget.onCompleted(otpCode);
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
