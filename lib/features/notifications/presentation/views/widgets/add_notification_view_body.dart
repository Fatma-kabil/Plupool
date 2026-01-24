import 'package:flutter/material.dart' hide TextField;
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/note_text_field.dart';
import 'package:plupool/features/notifications/data/models/notifiction_type_model.dart';
import 'package:plupool/features/notifications/presentation/views/widgets/notification_select_field.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';

class AddNotificationViewBody extends StatefulWidget {
  const AddNotificationViewBody({super.key});

  @override
  State<AddNotificationViewBody> createState() =>
      _AddNotificationViewBodyState();
}

class _AddNotificationViewBodyState extends State<AddNotificationViewBody> {
  final _formKey = GlobalKey<FormState>();

  NotificationType? selectedType;
  bool isTypeExpanded = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          /// ---------- المحتوى القابل للسكرول ----------
          Expanded(
            child: SingleChildScrollView(
            
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// نوع الإشعار
                  const FieldLabel('نوع الإشعار'),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isTypeExpanded = !isTypeExpanded;
                      });
                    },
                    child: NotificationSelectField(selected: selectedType),
                  ),

                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: isTypeExpanded
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
                                    style: AppTextStyles.styleSemiBold16(
                                      context,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedType = type;
                                      isTypeExpanded = false;
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                          )
                        : const SizedBox(),
                  ),

                  const SizedBox(height: 18),

                  /// عنوان الإشعار
                  const FieldLabel('عنوان الإشعار'),
                  TextField(
                    controller: nameController,
                    hint: 'اكتب عنوان الإشعار...',
                  ),

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

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          /// ---------- الزرار ثابت تحت ----------
          Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.w(10),
              right: SizeConfig.w(10),
              bottom: SizeConfig.h(15),
             // top: SizeConfig.h(10),
            ),
            child: CustomTextBtn(
              text: "إرسال",
              onPressed: () {},
              trailing:  Icon(Icons.send, color: Colors.white,size:SizeConfig.w(17)),
            ),
          ),
        ],
      ),
    );
  }
}
