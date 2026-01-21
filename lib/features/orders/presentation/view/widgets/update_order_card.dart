import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class UpdateOrderCard extends StatefulWidget {
  const UpdateOrderCard({super.key});

  @override
  State<UpdateOrderCard> createState() => _UpdateOrderCardState();
}

class _UpdateOrderCardState extends State<UpdateOrderCard> {
  String selectedProduct = "فلتر";
  final TextEditingController quantityController = TextEditingController(
    text: "2",
  );

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(16),
          vertical: SizeConfig.h(29),
        ),
        child: Container(
          width: SizeConfig.isWideScreen
              ? SizeConfig.screenWidth * 0.65
              : double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(16),
            vertical: SizeConfig.h(20),
          ),
          decoration: BoxDecoration(
            color: AppColors.kScaffoldColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ===== Current Product =====
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.w(12),
                    vertical: SizeConfig.h(8),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffCCE4F0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.inventory_2_outlined,
                            color: const Color(0xff2B8EC2),
                            size: SizeConfig.w(20),
                          ),
                          SizedBox(width: SizeConfig.w(6)),
                          Text(
                            "المنتج الحالي",
                            style: AppTextStyles.styleBold16(
                              context,
                            ).copyWith(color: AppColors.ktextcolor),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.h(6)),
                      Text(
                        "مضخة مياه عالية الكفاءة",
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: const Color(0xff7B7B7B)),
                      ),
                    ],
                  ),
                ),
                  
                SizedBox(height: SizeConfig.h(20)),
                  
                /// ===== Select New Product =====
                Text(
                  "أختر المنتج الجديد",
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: const Color(0xff555555)),
                ),
                SizedBox(height: SizeConfig.h(12)),
                  
                StatusSelector<String>(
                  icon: Icons.inventory_2_outlined,
                  selected: selectedProduct,
                  items: const ["فلتر", "مضخة مياه", "خزان مياه", "أنابيب توصيل"],
                  displayText: (value) => value,
                  onChanged: (val) {
                    setState(() => selectedProduct = val);
                  },
                ),
                SizedBox(height: SizeConfig.h(18)),
                Text(
                  "الكميه",
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: const Color(0xff555555)),
                ),
                SizedBox(height: SizeConfig.h(12)),
                TextFieldWithIcon(controller:quantityController ,hint: "ادخل الكميه الجديده",icon:Icons.format_list_numbered ,),
               
                SizedBox(height: SizeConfig.h(25)),
                  AddEditOfferViewFooter(onPressed: () {}, text: "حفظ"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
