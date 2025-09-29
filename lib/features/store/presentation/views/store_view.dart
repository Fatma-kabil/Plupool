import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/store/presentation/views/widgets/action_raw.dart';
import 'package:plupool/features/store/presentation/views/widgets/info_card_row.dart';

class StoreView extends StatefulWidget {
  const StoreView({super.key});

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
    String selected = "الكل";

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
              /// Dropdown للأجدد
              FilterOption(
          value: selected,
          items: const ["الكل", "العروض", "الأكثر شيوعا","الأعلي سعرا","الأقل سعرا"],
          onChanged: (val) {
            if (val != null) {
              setState(() {
                selected = val;
              });
            }
          }, 
        ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
