import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/notifications/data/models/notifiction_type_model.dart';
import 'package:plupool/features/notifications/presentation/views/widgets/notification_select_field.dart';

class NotificationTypeSelector extends StatefulWidget {
  final ValueChanged<NotificationType?> onChanged;

  const NotificationTypeSelector({
    super.key,
    required this.onChanged,
  });

  @override
  State<NotificationTypeSelector> createState() =>
      NotificationTypeSelectorState();
}

class NotificationTypeSelectorState
    extends State<NotificationTypeSelector> {
  NotificationType? _selected;

  bool _expanded = false;

  String? _errorText;

  bool validate() {
    if (_selected == null) {
      setState(() {
        _errorText = "من فضلك اختر نوع الإشعار";
      });
      return false;
    }

    setState(() {
      _errorText = null;
    });

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: NotificationSelectField(selected: _selected),
        ),

        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: _expanded
              ? Container(
                  decoration: BoxDecoration(
                    color: AppColors.kScaffoldColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.textFieldBorderColor,
                    ),
                  ),
                  child: Column(
                    children: notificationTypes.map((type) {
                      return ListTile(
                        leading: Icon(
                          type.icon,
                          size: SizeConfig.w(15),
                        ),
                        title: Text(
                          type.title,
                          style: AppTextStyles.styleSemiBold16(context),
                        ),
                        onTap: () {
                          setState(() {
                            _selected = type;
                            _expanded = false;
                            _errorText = null;
                          });

                          widget.onChanged(type);
                        },
                      );
                    }).toList(),
                  ),
                )
              : const SizedBox(),
        ),

        if (_errorText != null)
          Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.h(6),
              right: SizeConfig.w(4),
            ),
            child: Text(
              _errorText!,
              style: AppTextStyles.styleRegular10(
                context,
              ).copyWith(
                color: Colors.red,
              ),
            ),
          ),
      ],
    );
  }
}