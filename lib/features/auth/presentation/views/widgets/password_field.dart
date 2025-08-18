import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, required this.controller, this.validator, this.hintText});
   final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
     bool isWide =SizeConfig.screenWidth > 800;
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      cursorColor: Colors.black,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText:widget. hintText ??'كلمة المرور',
         hintStyle: AppTextStyles.styleRegular16(context).copyWith(fontSize:isWide?25: null,),
        prefixIcon: IconButton(
          icon: Icon(obscure ? Icons.visibility : Icons.visibility_off, color:hintTextColor),
          onPressed: () {
            setState(() {
              obscure = !obscure;
            });
          },
        ),
        fillColor: textFieldColor,
        filled: true,
        border: OutlineInputBorder(
    borderSide: BorderSide(color: textFieldBorderColor),
    borderRadius: BorderRadius.circular(12),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: textFieldBorderColor),
    borderRadius: BorderRadius.circular(12),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: textFieldBorderColor, width: 2),
    borderRadius: BorderRadius.circular(12),
  ),
      ),
    );
  }
}
