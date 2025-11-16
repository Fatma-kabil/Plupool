import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/views/widgets/cart_filled_section.dart';
import 'package:plupool/features/store/presentation/views/widgets/empty_card_section.dart';
import 'package:plupool/features/store/presentation/views/widgets/my_purchases_section.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> tabs = [
    {'title': ' مشترياتي', 'icon': Icons.inventory_2},
    {'title': ' السلة', 'icon': Icons.shopping_cart},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
      initialIndex: 1,
    );
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.h(20),
            left: SizeConfig.w(15),
            right: SizeConfig.w(15),
          ),
          child: Column(
            //  textDirection: TextDirection.rtl,
            children: [
              SizedBox(height: 15),
              // ✅ الجزء العلوي - Tabs buttons
              Row(
                //   textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(tabs.length, (index) {
                  bool isSelected = _tabController.index == index;

                  return GestureDetector(
                    onTap: () {
                      _tabController.index = index;
                      setState(() {});
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      width:
                          (screenWidth -
                              SizeConfig.w(16) * 2 -
                              SizeConfig.w(10)) /
                          2, // نصف العرض تقريبًا مع مسافة
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.w(10),
                        vertical: SizeConfig.h(8),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.kScaffoldColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border(
                          bottom: BorderSide(
                            color: isSelected
                                ? AppColors.kprimarycolor
                                : Colors.grey.shade300,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            tabs[index]['title'],
                            style: AppTextStyles.styleMedium20(context)
                                .copyWith(
                                  color: isSelected
                                      ? AppColors.kprimarycolor
                                      : Color(0xffAAAAAA),
                                ),
                          ),
                          SizedBox(width: SizeConfig.w(5)),
                          Icon(
                            tabs[index]['icon'],
                            size: SizeConfig.w(22),
                            color: isSelected
                                ? AppColors.kprimarycolor
                                : const Color(0xffAAAAAA),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              // ✅ المحتوى - بدون سحب (ولا أنيميشن)
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    MyPurchasesSection(),
                   //  EmptyCartSection(
                     // icon: Icons.shopping_bag_outlined,
                    //  tittle: "لا توجد مشتريات بعد",
                  //  ),
                    CartFilledSection(),
                    // السلة
                   
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//  Icon(Icons.inventory_2_outlined, size: 120, color: Colors.grey.shade300),