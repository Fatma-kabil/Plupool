import 'dart:io';

import 'package:flutter/material.dart' hide TextField;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/auth/presentation/views/widgets/profile_image_picker.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/products/domain/entities/product_entity.dart';
import 'package:plupool/features/products/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:plupool/features/products/presentation/cubits/product_cubit/product_state.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';
import 'package:plupool/features/store/domain/entities/category_entity.dart';
import 'package:plupool/features/store/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:plupool/features/store/presentation/cubits/category_cubit/category_state.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  File? _productImage;
  CategoryEntity? selectedCategory;

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    if (_productImage == null) {
      showCustomSnackBar(
        context: context,
        message: "من فضلك اختار صورة للمنتج",
        isSuccess: false,
      );
      return;
    }

    if (selectedCategory == null) {
      showCustomSnackBar(
        context: context,
        message: "من فضلك اختاري التصنيف",
        isSuccess: false,
      );
      return;
    }

    context.read<ProductCubit>().addProduct(
      Product(
        image: _productImage!,
        name: nameController.text,
        price: int.tryParse(priceController.text)!,
        stock: int.tryParse(quantityController.text)!,
        categoryId: selectedCategory!.id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductCubit, ProductState>(
      listener: (context, state) {
        if (state is ProductSuccess) {
          showCustomSnackBar(
            context: context,
            message: "تم إضافة المنتج بنجاح",
            isSuccess: true,
          );
        }

        if (state is ProductError) {
          showCustomSnackBar(
            context: context,
            message: state.message,
            isSuccess: false,
          );
        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🟡 اسم المنتج
              const FieldLabel('اسم المنتج'),
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                validator: (value) =>
                    value == null || value.isEmpty ? "مطلوب" : null,
                hint: 'اكتب اسم المنتج...',
              ),

              const SizedBox(height: 16),

              /// 🟡 السعر
              const FieldLabel('السعر'),
              TextFieldWithIcon(
                validator: (value) =>
                    Validators.number(value, fieldName: "السعر"),
                controller: priceController,
                hint: 'اكتب السعر...',
                keyboardType: TextInputType.number,
                icon: Icons.attach_money,
              ),

              const SizedBox(height: 16),

              /// 🟡 الكمية
              const FieldLabel('الكمية'),
              TextFieldWithIcon(
                validator: (value) =>
                    Validators.number(value, fieldName: "الكمية"),
                controller: quantityController,
                hint: 'اكتب الكمية...',
                keyboardType: TextInputType.number,
                icon: Icons.inventory_2_outlined,
              ),

              const SizedBox(height: 16),

              /// 🟡 التصنيف (Dynamic from API)
              const FieldLabel('التصنيف'),

              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "جاري تحميل التصنيفات...",
                        style: AppTextStyles.styleRegular16(
                          context,
                        ).copyWith(color: Colors.grey),
                      ),
                    );
                  }

                  if (state is CategoryError) {
                    return Text(state.message);
                  }

                  if (state is CategorySuccess) {
                    if (state.categories.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "مفيش تصنيفات متاحة 📭",
                          style: AppTextStyles.styleRegular16(
                            context,
                          ).copyWith(color: Colors.grey),
                        ),
                      );
                    }
                    return StatusSelector<CategoryEntity>(
                      selected: selectedCategory,
                      items: state.categories,
                      displayText: (cat) => cat.name,
                      onChanged: (val) =>
                          setState(() => selectedCategory = val),
                      icon: Icons.category_outlined,
                    );
                  }
                  return const SizedBox();
                },
              ),

              const SizedBox(height: 20),

              /// 🟡 صورة المنتج
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

              /// 🟡 زرار الإضافة
              BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  final isLoading = state is ProductLoading;

                  return AddEditOfferViewFooter(
                    text: isLoading ? "جارٍ الإضافة..." : "إضافة",
                    onPressed: isLoading ? null : _submit,
                  );
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
