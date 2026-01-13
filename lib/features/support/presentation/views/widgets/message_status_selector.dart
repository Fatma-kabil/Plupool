import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/message_status_text.dart';
import 'package:plupool/core/utils/size_config.dart';

class StatusSelector extends StatefulWidget {
  const StatusSelector({
    super.key,
    required this.selectedStatus,
    required this.items,
    required this.onChanged,
  });

  final dynamic selectedStatus;
  final List<dynamic> items;
  final ValueChanged<dynamic> onChanged;

  @override
  State<StatusSelector> createState() => _StatusSelectorState();
}

class _StatusSelectorState extends State<StatusSelector> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ===== Header =====
          GestureDetector(
            onTap: () => setState(() => isOpen = !isOpen),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(12),
                vertical: SizeConfig.h(10),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: const Radius.circular(12),
                  bottom: Radius.circular(isOpen ? 0 : 12),
                ),
                border: Border.all(color:  AppColors.textFieldBorderColor),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: SizeConfig.w(18),
                    color: const Color(0xff777777),
                  ),
                  SizedBox(width: SizeConfig.w(6)),
                  Expanded(
                    child: Text(
                      statusText(widget.selectedStatus),
                      style: AppTextStyles.styleRegular14(
                        context,
                      ).copyWith(color: const Color(0xff777777)),
                    ),
                  ),
                  AnimatedRotation(
                    turns: isOpen ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: SizeConfig.w(18),
                      color: const Color(0xff777777),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// ===== Dropdown =====
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: isOpen
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(12),
                      ),
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.textFieldBorderColor,
                        ),
                        left: BorderSide(color: AppColors.textFieldBorderColor),
                        right: BorderSide(
                          color: AppColors.textFieldBorderColor,
                        ),
                      ),
                    ),
                    child: Column(
                      children: widget.items.map((status) {
                        return InkWell(
                          onTap: () {
                            widget.onChanged(status);
                            setState(() => isOpen = false);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.w(18),
                              vertical: SizeConfig.h(8),
                            ),
                            child: Text(
                              statusText(status),
                              style: AppTextStyles.styleRegular14(
                                context,
                              ).copyWith(color: const Color(0xff777777)),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
