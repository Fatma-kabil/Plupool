import 'dart:io';

import 'package:flutter/material.dart' hide TextField;
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/views/widgets/profile_image_picker.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/products/presentation/views/widgets/edit_product_view_body_footer.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';
import 'package:plupool/features/store/data/models/product_model.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class EditProductViewBody extends StatefulWidget {
  const EditProductViewBody({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<EditProductViewBody> createState() => _EditProductViewBodyState();
}

class _EditProductViewBodyState extends State<EditProductViewBody> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController priceController;
  late final TextEditingController quantityController;
  late final TextEditingController imageController;

  late String selectedCategory;
  File? _productImage;

  final List<String> categories = const [
    "فلاتر",
    "مضخات",
    "مواد تنظيف",
    "اكسسوارات",
  ];

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.product.name);
    priceController = TextEditingController(
      text: widget.product.originalPrice.toString(),
    );
    quantityController = TextEditingController(
      text: widget.product.stock.toString(),
    );
    imageController = TextEditingController(text: widget.product.image);

    selectedCategory = widget.product.category ?? categories.first;
  }

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
            TextField(
              controller: nameController,
              hint: 'اكتب اسم المنتج...',
            ),

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

            const SizedBox(height: 12),

            /// صورة حالية
            if (_productImage == null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imageController.text,
                  height: SizeConfig.h(90),
                  width: SizeConfig.w(90),
                  fit: BoxFit.cover,
                ),
              ),

            if (_productImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  _productImage!,
                  height: SizeConfig.isWideScreen ? SizeConfig.w(90) : SizeConfig.h(90),
                  width: SizeConfig.w(90),
                  fit: BoxFit.cover,
                ),
              ),

            const SizedBox(height: 40),
            EditProductViewBodyFooter()
          ],
        ),
      ),
    );
  }
}
