import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/product_filter_helper.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/store_filter.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/store/presentation/data/models/product_model.dart';
import 'package:plupool/features/store/presentation/views/widgets/action_raw.dart';
import 'package:plupool/core/utils/widgets/filter_button.dart';
import 'package:plupool/features/store/presentation/views/widgets/filter_dialog.dart';
import 'package:plupool/features/store/presentation/views/widgets/info_card_row.dart';
import 'package:plupool/features/store/presentation/views/widgets/products_grid.dart';

class StoreView extends StatefulWidget {
  final StoreFilter? initialFilter;

  const StoreView({super.key, this.initialFilter});

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  late StoreFilter selected;
  final int topCount = 3;

  @override
  void initState() {
    super.initState();
    selected = widget.initialFilter ?? StoreFilter.all;
  }

  // 👇👇 أهم إضافة — تحديث الفلتر عند تغيّر initialFilter
  @override
  void didUpdateWidget(covariant StoreView oldWidget) {
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
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.h(15),
        left: SizeConfig.w(16),
        right: SizeConfig.w(16),
      ),
      child: ListView(
        children: [
          ActionsRow(cartCount: 0),
          const SizedBox(height: 30),
          const InfoCardsRow(),
          const SizedBox(height: 5),
          Text('الفئات', style: AppTextStyles.styleBold20(context).copyWith(color: Colors.black)),
          const SizedBox(height: 16),

          Row(
            children: [
               FilterOption(
                icon: Icons.keyboard_arrow_down,
                value: selected.label,
                items: StoreFilter.values.map((f) => f.label).toList(),
                onChanged: (val) {
                  setState(() {
                    selected =
                        StoreFilter.values.firstWhere((f) => f.label == val);
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

          const SizedBox(height: 28),

          ProductsGrid(products: filteredProducts),
        ],
      ),
    );
  }
}
