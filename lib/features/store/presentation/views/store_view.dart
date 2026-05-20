import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/store_filter.dart';
import 'package:plupool/features/store/presentation/views/widgets/action_raw.dart';
import 'package:plupool/features/store/presentation/views/widgets/info_card_row.dart';
import 'package:plupool/features/store/presentation/views/widgets/stores_widget_section.dart';

class StoreView extends StatefulWidget {
  final StoreFilter? initialFilter;

  const StoreView({super.key, this.initialFilter});

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
 
 

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
          const SizedBox(height: 15),
          Text('الفئات', style: AppTextStyles.styleBold20(context).copyWith(color: Colors.black)),
          const SizedBox(height: 10),
          const StoresWidgetSection(),
         

     //    
        ],
      ),
    );
  }
}
