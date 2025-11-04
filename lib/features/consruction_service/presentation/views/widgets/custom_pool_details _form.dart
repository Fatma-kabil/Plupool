import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomPoolDetailsForm extends StatefulWidget {
  const CustomPoolDetailsForm({
    super.key,
    required this.hintText,
    this.validator,
    required this.controller,
    required this.iconpath,
  });

  final String hintText;
  final String iconpath;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  State<CustomPoolDetailsForm> createState() => _CustomPoolDetailsFormState();
}

class _CustomPoolDetailsFormState extends State<CustomPoolDetailsForm> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            cursorColor: AppColors.kprimarycolor,
            controller: widget.controller,
            validator: (value) {
              final error = widget.validator?.call(value);
              setState(() => _errorText = error);
              return null; // ❌ منرجعش error هنا عشان نعرضها يدوي
            },
            keyboardType: TextInputType.number,
            style: AppTextStyles.styleRegular16(context).copyWith(
              color: AppColors.kprimarycolor,
            ),
            cursorHeight:
                SizeConfig.isWideScreen ? SizeConfig.w(12) : SizeConfig.h(20),
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.textFieldBorderColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: widget.hintText,
              hintStyle: AppTextStyles.styleRegular13(context),
              contentPadding: EdgeInsets.symmetric(
                vertical: SizeConfig.h(10),
                horizontal: SizeConfig.w(14),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  right: SizeConfig.w(10),
                  left: SizeConfig.w(0),
                ),
                child: SvgPicture.asset(
                  widget.iconpath,
                  color: AppColors.hintTextColor,
                  height:SizeConfig.isWideScreen?SizeConfig.w(20): SizeConfig.w(26),
                  width: SizeConfig.isWideScreen?SizeConfig.w(20): SizeConfig.w(26),
                //   fit: BoxFit.scaleDown,
                ),
              ),
                // ✅ ده اللي هيقلل المسافة
              prefixIconConstraints: BoxConstraints(
                minWidth: SizeConfig.w(25),
              //  minHeight: SizeConfig.h(28),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: _errorText != null
                      ? Colors.red
                      : AppColors.textFieldBorderColor,
                  width: 1.2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: _errorText != null
                      ? Colors.red[900]!
                      : AppColors.textFieldBorderColor,
                  width: 1.0,
                ),
              ),
            ),
          ),
          if (_errorText != null) ...[
            SizedBox(height: SizeConfig.h(4)),
            Padding(
              padding: EdgeInsets.only(right: SizeConfig.w(4)),
              child: Text(
                _errorText!,
                textDirection: TextDirection.rtl,
                style: AppTextStyles.styleRegular14(context).copyWith(
                  color: Colors.red[900],
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
