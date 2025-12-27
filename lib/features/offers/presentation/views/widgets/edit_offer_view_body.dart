import 'dart:io';

import 'package:flutter/material.dart' hide TextField;
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/date_picker_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/profile_image_picker.dart';
import 'package:plupool/features/home/data/models/offer_model.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/offers/presentation/views/widgets/custom_check_btn.dart';
import 'package:plupool/features/offers/presentation/views/widgets/description_input.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';

class EditOfferViewBody extends StatefulWidget {
  const EditOfferViewBody({super.key, required this.offer});
  final OfferModel offer;

  @override
  State<EditOfferViewBody> createState() => _EditOfferViewBodyState();
}

class _EditOfferViewBodyState extends State<EditOfferViewBody> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController titleController;
  late final TextEditingController offerController;
  late final TextEditingController desController;
  late final TextEditingController imageController;
  File? _profileImage;
  DateTime? startDate;
  DateTime? endDate;
  String? startDateError;
  String? endDateError;
  bool acceptedTerms = false;

  @override
  void initState() {
    super.initState();

    // تهيئة الكونترولرز بالقيم من الـ offer
    titleController = TextEditingController(text: widget.offer.title);
    offerController = TextEditingController(text: widget.offer.offerPercentage);
    desController = TextEditingController(text: widget.offer.desc);
    imageController = TextEditingController(text: widget.offer.image);
    startDate = widget.offer.startDate;
    endDate = widget.offer.endDate;

    // لو عندك صورة، ممكن تحطها هنا _profileImage = ...
    // لو عندك قيمة acceptedTerms من العرض، هتعيطها برضه هنا
  }

  @override
  void dispose() {
    titleController.dispose();
    offerController.dispose();
    desController.dispose();
    super.dispose();
  }

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FieldLabel('عنوان العرض'),
            TextField(
              controller: titleController,
              hint: 'أكتب عنوان العرض....',
            ),

            const SizedBox(height: 15),

            const FieldLabel('قيمة الخصم'),
            TextField(controller: offerController, hint: 'أكتب قيمة الخصم....'),

            const SizedBox(height: 15),

            DatePickerField(
              dirc: CrossAxisAlignment.start,
              text: "تاريخ بدء العرض",
              selectedDateColor: AppColors.ktextcolor,
              selectedDate: startDate,
              dateFormat: formatDate,
              errorText: startDateError,
              onTap: () async {
                final picked = await pickDateFun(context);
                if (picked != null) {
                  setState(() {
                    startDate = picked;
                    startDateError = null;
                  });
                }
              },
            ),
            const SizedBox(height: 15),

            DatePickerField(
              dirc: CrossAxisAlignment.start,
              text: "تاريخ نهاية العرض",
              selectedDateColor: AppColors.ktextcolor,
              selectedDate: endDate,
              dateFormat: formatDate,
              errorText: endDateError,
              onTap: () async {
                final picked = await pickDateFun(context);
                if (picked != null) {
                  setState(() {
                    endDate = picked;
                    endDateError = null;
                  });
                }
              },
            ),
            const SizedBox(height: 15),
            const FieldLabel('وصف العرض'),
            DescriptionInputContainer(controller: desController),

            const SizedBox(height: 20),
            const FieldLabel('صور العرض'),
            ProfileImagePicker(
              backgroundColor: const Color(0xffCDCDCD),
              title: "أضف صورة للعرض",
              isCircle: false,
              icon: Icons.add_photo_alternate_outlined,
              onImagePicked: (img) => setState(() => _profileImage = img),
            ),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // عدل الرقم ع حسب الحاجة
              child: Image.asset(
                imageController.text,
                height: SizeConfig.h(90),
                width: SizeConfig.w(80),
                fit: BoxFit.cover, // عشان الصورة تملأ الشكل كويس
              ),
            ),
            const SizedBox(height: 15),
            CustomCheckbtn(
              value: acceptedTerms,
              onChanged: (val) => setState(() => acceptedTerms = val),
              label: "عرض مميز (يظهر في الصفحة الرئيسية)",
            ),

            const SizedBox(height: 40),

            AddEditOfferViewFooter(
              onPressed: () {
                // هنا ممكن تضيف كود حفظ التعديل
              },
              text: "تعديل",
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
