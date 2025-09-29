import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/store/presentation/data/models/product_model.dart';
import 'package:plupool/features/store/presentation/views/widgets/action_raw.dart';
import 'package:plupool/features/store/presentation/views/widgets/filter_button.dart';
import 'package:plupool/features/store/presentation/views/widgets/filter_dialog.dart';
import 'package:plupool/features/store/presentation/views/widgets/info_card_row.dart';
import 'package:plupool/features/store/presentation/views/widgets/product_card.dart';

class StoreView extends StatefulWidget {
  const StoreView({super.key});

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  String selected = "الكل";
  final int topCount = 1; // 👈 عدد العناصر اللي تاخد بادج

  final List<ProductModel> products = [
    ProductModel(
      name: "منتج 1",
      image: "assets/images/project1.png",
      originalPrice: 200,
      salesCount: 30,
      discountPercent: 20, // خصم 20%
    ),
    ProductModel(
      name: "منتج 2",
      image: "assets/images/project2.png",
      originalPrice: 500,
      salesCount: 10,
    ),
    ProductModel(
      name: "منتج 3",
      image: "assets/images/project3.png",
      originalPrice: 100,
      salesCount: 50,
    ),
    ProductModel(
      name: "منتج 4",
      image: "assets/images/project4.png",
      originalPrice: 300,
      salesCount: 20,
      discountPercent: 10, // خصم 10%
    ),
    ProductModel(
      name: "منتج 3",
      image: "assets/images/project3.png",
      originalPrice: 40,
      salesCount: 68,
    ),
    ProductModel(
      name: "منتج 4",
      image: "assets/images/project4.png",
      originalPrice: 800,
      salesCount: 34,
      // خصم 10%
    ),
  ];

  List<ProductModel> get filteredProducts {
    List<ProductModel> list = [...products];

    switch (selected) {
      case "الأعلي سعرا":
        list.sort((a, b) => b.originalPrice.compareTo(a.originalPrice));
        for (int i = 0; i < list.length && i < topCount; i++) {
          list[i] = list[i].copyWith(badge: ProductBadge.highPrice);
        }
        break;

      case "الأقل سعرا":
        list.sort((a, b) => a.originalPrice.compareTo(b.originalPrice));
        for (int i = 0; i < list.length && i < topCount; i++) {
          list[i] = list[i].copyWith(badge: ProductBadge.lowPrice);
        }
        break;

      case "الأكثر شيوعا":
        list.sort((a, b) => b.salesCount.compareTo(a.salesCount));
        for (int i = 0; i < list.length && i < topCount; i++) {
          list[i] = list[i].copyWith(badge: ProductBadge.bestSeller);
        }
        break;

      case "العروض":
        list = list
            .map(
              (p) =>
                  p.hasDiscount ? p.copyWith(badge: ProductBadge.discount) : p,
            )
            .toList();
        break;
      case "الكل":
        // 1- خصومات
        list = list.map((p) {
          if (p.hasDiscount) {
            return p.copyWith(badge: ProductBadge.discount);
          }
          return p;
        }).toList();

        // 2- الأكثر مبيعاً
        List<ProductModel> sortedBySales = [...list];
        sortedBySales.sort((a, b) => b.salesCount.compareTo(a.salesCount));
        for (int i = 0; i < sortedBySales.length && i < topCount; i++) {
          final idx = list.indexOf(sortedBySales[i]);
          if (list[idx].badge == ProductBadge.none) {
            list[idx] = list[idx].copyWith(badge: ProductBadge.bestSeller);
          }
        }

        // 3- الأعلى سعراً
        List<ProductModel> sortedByHighPrice = [...list];
        sortedByHighPrice.sort(
          (a, b) => b.originalPrice.compareTo(a.originalPrice),
        );
        for (int i = 0; i < sortedByHighPrice.length && i < topCount; i++) {
          final idx = list.indexOf(sortedByHighPrice[i]);
          if (list[idx].badge == ProductBadge.none) {
            list[idx] = list[idx].copyWith(badge: ProductBadge.highPrice);
          }
        }

        // 4- الأقل سعراً
        List<ProductModel> sortedByLowPrice = [...list];
        sortedByLowPrice.sort(
          (a, b) => a.originalPrice.compareTo(b.originalPrice),
        );
        for (int i = 0; i < sortedByLowPrice.length && i < topCount; i++) {
          final idx = list.indexOf(sortedByLowPrice[i]);
          if (list[idx].badge == ProductBadge.none) {
            list[idx] = list[idx].copyWith(badge: ProductBadge.lowPrice);
          }
        }
        break;
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 16, right: 16),
      child: ListView(
        children: [
          ActionsRow(cartCount: 0),
          SizedBox(height: 30), // الصف اللي فيه الثلاث بطاقات

          InfoCardsRow(),
          SizedBox(height: 5),
          Text('الفئات', style: AppTextStyles.styleBold20(context)),
          SizedBox(height: 16),
          Row(
            children: [
              FilterButton(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => FilterDialog(),
                  );
                },
              ),
              Spacer(),

              /// Dropdown للأجدد
              FilterOption(
                icon: Icons.keyboard_arrow_down,
                value: selected,
                items: const [
                  "الكل",
                  "العروض",
                  "الأكثر مبيعا",
                  "الأعلي سعرا",
                  "الأقل سعرا",
                ],
                onChanged: (val) => setState(() => selected = val!),
              ),
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return ProductCard(product: filteredProducts[index]);
            },
          ),
        ],
      ),
    );
  }
}
