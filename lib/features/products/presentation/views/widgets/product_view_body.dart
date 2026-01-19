import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/product_filter_helper.dart';
import 'package:plupool/core/utils/store_filter.dart';
import 'package:plupool/core/utils/widgets/filter_button.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/products/presentation/views/widgets/product_view_header.dart';
import 'package:plupool/features/products/presentation/views/widgets/products_list.dart';
import 'package:plupool/features/store/data/models/product_model.dart';
import 'package:plupool/features/store/presentation/views/widgets/filter_dialog.dart';

class ProductViewBody extends StatefulWidget {
  final StoreFilter? initialFilter;

  ProductViewBody({super.key, this.initialFilter});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  late StoreFilter selected;
  final int topCount = 3;

  @override
  void initState() {
    super.initState();
    selected = widget.initialFilter ?? StoreFilter.all;
  }

  @override
  void didUpdateWidget(covariant ProductViewBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialFilter != oldWidget.initialFilter) {
      setState(() {
        selected = widget.initialFilter ?? StoreFilter.all;
      });
    }
  }

  List<ProductModel> get filteredProducts =>
      ProductFilterHelper.applyFilter(products, selected, topCount: topCount);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: ProductViewHeader()),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
          child: Row(
            children: [
              FilterOption(
                icon: Icons.keyboard_arrow_down,
                value: selected.label,
                items: StoreFilter.values
                    .where((f) => f != StoreFilter.discount) // استثناء "العروض"
                    .map((f) => f.label)
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    selected = StoreFilter.values.firstWhere((f) => f.label == val);
                  });
                },
              ),
              const Spacer(),
              FilterButton(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => const FilterDialog(),
                  );
                },
              ),
            ],
          ),
        ),
        ProductsList(products: filteredProducts),
      ],
    );
  }
}
