import 'dart:io';

import 'package:flutter/material.dart' hide TextField;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/auth/presentation/views/widgets/profile_image_picker.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/products/domain/entities/product_entity.dart';
import 'package:plupool/features/products/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:plupool/features/products/presentation/cubits/product_cubit/product_state.dart';
import 'package:plupool/features/products/presentation/views/widgets/edit_product_view_body_footer.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';
import 'package:plupool/features/store/domain/entities/category_entity.dart';
import 'package:plupool/features/store/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:plupool/features/store/presentation/cubits/category_cubit/category_state.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class EditProductViewBody extends StatefulWidget {
  const EditProductViewBody({super.key, required this.product});

  final Product product;

  @override
  State<EditProductViewBody> createState() => _EditProductViewBodyState();
}

class _EditProductViewBodyState extends State<EditProductViewBody> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController priceController;
  late final TextEditingController quantityController;
  late final TextEditingController imageController;

  late CategoryEntity selectedCategory;
  File? _productImage;

  bool _initializedCategory = false;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.product.name);
    priceController = TextEditingController(text: widget.product.price.toString());
    quantityController = TextEditingController(text: widget.product.stock.toString());
    imageController = TextEditingController(text: widget.product.imageUrl ?? "");
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    quantityController.dispose();
    imageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    if (_productImage == null && imageController.text.isEmpty) {
      showCustomSnackBar(
        context: context,
        message: "من فضلك اختر صورة للمنتج",
        isSuccess: false,
      );
      return;
    }

    final int? price = int.tryParse(priceController.text);
    final int? stock = int.tryParse(quantityController.text);

    if (price == null || stock == null) {
      showCustomSnackBar(
        context: context,
        message: "السعر والكمية يجب أن يكونوا أرقامًا صحيحة",
        isSuccess: false,
      );
      return;
    }

    context.read<ProductCubit>().updateProduct(
      Product(
        id: widget.product.id,
        name: nameController.text,
        image: _productImage,
        price: price,
        stock: stock,
        categoryId: selectedCategory.id,
        imageUrl: _productImage == null ? widget.product.imageUrl : null,
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
            message: state.message,
            isSuccess: true,
          );
          Future.delayed(const Duration(milliseconds: 300), () {
            Navigator.pop(context);
          });
        }

        if (state is UpdateProductError) {
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

              /// اسم المنتج
              const FieldLabel('اسم المنتج'),
              TextField(
                controller: nameController,
                hint: 'اكتب اسم المنتج...',
                keyboardType: TextInputType.text,
                validator: (value) =>
                    value == null || value.isEmpty ? "مطلوب" : null,
              ),

              const SizedBox(height: 16),

              /// السعر
              const FieldLabel('السعر'),
              TextFieldWithIcon(
                controller: priceController,
                hint: 'اكتب السعر...',
                keyboardType: TextInputType.number,
                icon: Icons.payments_outlined,
                validator: (value) =>
                    Validators.number(value, fieldName: "السعر"),
              ),

              const SizedBox(height: 16),

              /// الكمية
              const FieldLabel('الكمية'),
              TextFieldWithIcon(
                controller: quantityController,
                hint: 'اكتب الكمية...',
                keyboardType: TextInputType.number,
                icon: Icons.inventory_2_outlined,
                validator: (value) =>
                    Validators.number(value, fieldName: "الكمية"),
              ),

              const SizedBox(height: 16),

              /// التصنيف
              const FieldLabel('التصنيف'),

              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text("جاري تحميل التصنيفات..."),
                    );
                  }

                  if (state is CategoryError) {
                    return Text(state.message);
                  }

                  if (state is CategorySuccess) {
                    if (state.categories.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text("مفيش تصنيفات متاحة 📭"),
                      );
                    }

                    if (!_initializedCategory) {
                      selectedCategory = state.categories.firstWhere(
                        (e) => e.id == widget.product.categoryId,
                        orElse: () => state.categories.first,
                      );
                      _initializedCategory = true;
                    }

                    return StatusSelector<CategoryEntity>(
                      selected: selectedCategory,
                      items: state.categories,
                      displayText: (cat) => cat.name,
                      onChanged: (val) {
                        setState(() {
                          selectedCategory = val;
                        });
                      },
                      icon: Icons.category_outlined,
                    );
                  }

                  return const SizedBox();
                },
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

              if (_productImage == null &&
                  imageController.text.isNotEmpty &&
                  imageController.text.startsWith("http"))
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
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
                    height: SizeConfig.h(90),
                    width: SizeConfig.w(90),
                    fit: BoxFit.cover,
                  ),
                ),

              const SizedBox(height: 40),

              EditProductViewBodyFooter(
                editfun: _submit,
                deleteFun: () {
                  context.read<ProductCubit>().deleteProduct(
                    widget.product.id!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}