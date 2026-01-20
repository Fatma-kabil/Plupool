import 'dart:io';

import 'package:flutter/material.dart' hide TextField;
import 'package:plupool/features/auth/presentation/views/widgets/profile_image_picker.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

// لو TextFieldWithIcon مش عندك، ممكن تستخدم TextField الموجود عندك أو تستبدله
// وكمان StatusSelector لازم يكون عندك أو تستبدله ب DropdownButton أو أي ويدجت مناسب

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  final imageController = TextEditingController();

  late String selectedCategory = "فلاتر"; // خلي قيمة مبدئية

  File? _productImage;

  final List<String> categories = const [
    "فلاتر",
    "مضخات",
    "مواد تنظيف",
    "اكسسوارات",
  ];

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    quantityController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// اسم المنتج
            const FieldLabel('اسم المنتج'),
            TextField(controller: nameController, hint: 'اكتب اسم المنتج...'),

            const SizedBox(height: 16),

            /// السعر
            const FieldLabel('السعر'),
            TextFieldWithIcon(
              controller: priceController,
              hint: 'اكتب السعر...',
              keyboardType: TextInputType.number,
              icon: Icons.attach_money,
            ),

            const SizedBox(height: 16),

            /// الكمية
            const FieldLabel('الكمية'),
            TextFieldWithIcon(
              controller: quantityController,
              hint: 'اكتب الكمية...',
              keyboardType: TextInputType.number,
              icon: Icons.inventory_2_outlined,
            ),

            const SizedBox(height: 16),

            /// التصنيف
            const FieldLabel('التصنيف'),
            StatusSelector<String>(
              selected: selectedCategory,
              items: categories,
              displayText: (status) => status,
              onChanged: (val) {
                setState(() => selectedCategory = val);
              },
              icon: Icons.category_outlined,
            ),

            const SizedBox(height: 20),

            /// صورة المنتج
            const FieldLabel('صورة المنتج'),
            ProfileImagePicker(
              backgroundColor: const Color(0xffCDCDCD).withAlpha(70),
              title: "أضف صورة للمنتج",
              isCircle: false,
              icon: Icons.add_photo_alternate_outlined,
              onImagePicked: (img) {
                setState(() => _productImage = img);
              },
            ),

            const SizedBox(height: 40),

            AddEditOfferViewFooter(onPressed: () {}, text: "إضافة"),
            const SizedBox(height: 30), // لازم يكون معرف الكومبوننت ده أو تبدله
          ],
        ),
      ),
    );
  }
}
