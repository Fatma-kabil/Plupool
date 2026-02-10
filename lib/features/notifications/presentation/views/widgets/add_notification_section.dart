import 'package:flutter/material.dart' hide TextField;
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/note_text_field.dart';
import 'package:plupool/features/notifications/data/models/notifiction_type_model.dart';
import 'package:plupool/features/notifications/presentation/views/widgets/notification_target_selector.dart';
import 'package:plupool/features/notifications/presentation/views/widgets/notification_type_selector.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';

class AddNotificationSection extends StatefulWidget {
  const AddNotificationSection({super.key});

  @override
  State<AddNotificationSection> createState() => _AddNotificationSectionState();
}

class _AddNotificationSectionState extends State<AddNotificationSection> {
  final _formKey = GlobalKey<FormState>();
  final _targetKey = GlobalKey<State<NotificationTargetSelector>>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  Set<String> selectedTargets = {};
  NotificationType? selectedType;

  void _submit() {
    final targetState = _targetKey.currentState as dynamic;

    if (!targetState.validate()) return;
    if (!_formKey.currentState!.validate()) return;

    debugPrint(selectedTargets.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NotificationTargetSelector(
                    key: _targetKey,
                    onChanged: (val) => selectedTargets = val,
                  ),
                  const SizedBox(height: 20),
                   const FieldLabel('نوع الإشعار'),
                  NotificationTypeSelector(onChanged: (val) => selectedType = val),
                  const SizedBox(height: 18),
              
                  /// عنوان الإشعار
                  const FieldLabel('عنوان الإشعار'),
                  TextField(controller: nameController, hint: 'اكتب عنوان الإشعار...'),
              
                  const SizedBox(height: 18),
              
                  /// نص الإشعار
                  const FieldLabel('نص الإشعار'),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.w(4),
                      vertical: SizeConfig.h(6),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.textFieldBorderColor),
                    ),
                    child: NoteTextField(
                      controller: textController,
                      text: 'اكتب نص الإشعار...',
                    ),
                  ),
              
             //     const SizedBox(height: 40),
                 
                ],
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.w(6),
              right: SizeConfig.w(6),
           //   bottom: SizeConfig.h(10),
            ),
            child: CustomTextBtn(
              text: "إرسال",
              onPressed: _submit,
              trailing: Icon(
                Icons.send,
                color: Colors.white,
                size: SizeConfig.w(17),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
