import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/enums/week_day.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';

class WeekDaysMultiSelectField extends StatefulWidget {
  const WeekDaysMultiSelectField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<WeekDaysMultiSelectField> createState() =>
      _WeekDaysMultiSelectFieldState();
}

class _WeekDaysMultiSelectFieldState extends State<WeekDaysMultiSelectField> {
  bool isExpanded = false;
  final Set<WeekDay> selectedDays = {};

  void _updateController() {
    widget.controller.text = selectedDays.map(weekDayLabel).join(' , ');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// الفيلد
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AbsorbPointer(
            child: 
            
            
            TextFieldWithIcon(
              hint: "اختار أيام الصيانه",
              icon: Icons.calendar_month,
              controller: widget.controller,
              tailing: true,
            ),
          ),
        ),

        AnimatedCrossFade(
          duration: const Duration(milliseconds: 200),
          crossFadeState: isExpanded
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: Container(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.h(8),
              horizontal: SizeConfig.w(8),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border(
                bottom: BorderSide(color: AppColors.textFieldBorderColor),
                left: BorderSide(color: AppColors.textFieldBorderColor),
                right: BorderSide(color: AppColors.textFieldBorderColor),
              ),
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: WeekDay.values.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // كل 3 أيام في سطر
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                childAspectRatio: 3.0, // أقصر شوي → شكل أنضف
              ),
              itemBuilder: (context, index) {
                final day = WeekDay.values[index];
                final isSelected = selectedDays.contains(day);

                return InkWell(
                  onTap: () {
                    setState(() {
                      isSelected
                          ? selectedDays.remove(day)
                          : selectedDays.add(day);
                      _updateController();
                    });
                  },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        fillColor: MaterialStateProperty.all(Colors.white),
                        checkColor: AppColors.kprimarycolor,

                        side: BorderSide(
                          color: AppColors.kprimarycolor, // 🔹 هنا لون البوردر
                          // سمك البوردر
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        value: isSelected,
                        onChanged: (checked) {
                          setState(() {
                            checked == true
                                ? selectedDays.add(day)
                                : selectedDays.remove(day);
                            _updateController();
                          });
                        },
                        visualDensity: VisualDensity.compact,
                      ),
                      Flexible(
                        child: Text(
                          weekDayLabel(day),
                          style: AppTextStyles.styleSemiBold15(context),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          secondChild: const SizedBox.shrink(),
        ),
      ],
    );
  }
}
