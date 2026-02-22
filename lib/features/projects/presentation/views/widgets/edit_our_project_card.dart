import 'dart:io';

import 'package:flutter/material.dart' hide TextField;
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/auth/presentation/views/widgets/profile_image_picker.dart';
import 'package:plupool/features/home/data/models/project_card_model.dart';
import 'package:plupool/features/offers/presentation/views/widgets/description_input.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';

class EditOurProjectCard extends StatefulWidget {
  const EditOurProjectCard({super.key, required this.model});
  final ProjectCardModel model;

  @override
  State<EditOurProjectCard> createState() => _EditOurProjectCardState();
}

class _EditOurProjectCardState extends State<EditOurProjectCard> {
  late final TextEditingController titleController;
  late final TextEditingController offerController;
  late final TextEditingController desController;
  late final TextEditingController imageController;
  // ignore: unused_field
  File? _profileImage;
  @override
  void initState() {
    super.initState();

    // تهيئة الكونترولرز بالقيم من الـ offer
    titleController = TextEditingController(text: widget.model.title);
    desController = TextEditingController(text: widget.model.description);
    imageController = TextEditingController(text: widget.model.imageUrl);

    // لو عندك صورة، ممكن تحطها هنا _profileImage = ...
    // لو عندك قيمة acceptedTerms من العرض، هتعيطها برضه هنا
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(20),
          vertical: SizeConfig.h(29),
        ),
        child: Container(
          width: SizeConfig.isWideScreen
              ? SizeConfig.screenWidth * 0.85
              : double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(20),
            vertical: SizeConfig.h(25),
          ),
          decoration: BoxDecoration(
            color: AppColors.kScaffoldColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FieldLabel('عنوان المشروع'),
                TextField(
                  controller: titleController,
                  hint: 'أكتب عنوان المشروع....',
                ),

                const SizedBox(height: 20),
                const FieldLabel('وصف العرض'),
                DescriptionInputContainer(controller: desController),
                const SizedBox(height: 25),
                const FieldLabel('صوره المشروع'),
                ProfileImagePicker(
                  backgroundColor: Color(0xffCDCDCD).withAlpha(70),
                  title: "أضف صورة للمشروع",
                  isCircle: false,
                  icon: Icons.add_photo_alternate_outlined,
                  onImagePicked: (img) => _profileImage = img,
                ),
                const SizedBox(height: 15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    12,
                  ), // عدل الرقم ع حسب الحاجة
                  child: Image.asset(
                    imageController.text,
                    height: SizeConfig.h(90),
                    width: SizeConfig.w(80),
                    fit: BoxFit.cover, // عشان الصورة تملأ الشكل كويس
                  ),
                ),
                const SizedBox(height: 55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextBtn(
                      text: "إضافة",
                      onPressed: () {},
                      padding: SizeConfig.isWideScreen ? 12 : 7,
                      width: SizeConfig.w(120),
                      textStyle: AppTextStyles.styleBold16(
                        context,
                      ).copyWith(color: Colors.white),
                      trailing: Icon(
                        Icons.edit_note,
                        color: Colors.white,
                        size: SizeConfig.w(15),
                      ),
                    ),

                    CustomOutlinedBtn(
                      text: 'إلغاء',
                      trailing: Icon(
                        Icons.cancel_outlined,
                        color: AppColors.kprimarycolor,
                        size: SizeConfig.w(15),
                      ),
                      width: SizeConfig.w(120),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
