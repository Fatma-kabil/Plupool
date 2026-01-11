import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/tab_with_count.dart';

class CustomerServiceViewBody extends StatefulWidget {
  const CustomerServiceViewBody({super.key});

  @override
  State<CustomerServiceViewBody> createState() =>
      _CustomerServiceViewBodyState();
}

class _CustomerServiceViewBodyState extends State<CustomerServiceViewBody> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        slivers: [
          /// TabBar
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(6),
               
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffF1F1F1),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    offset: Offset(0, 1),
                    color: Colors.black26,
                  ),
                ],
              ),
              child: TabBar(
                labelStyle: AppTextStyles.styleRegular16(context)
                    .copyWith(fontFamily: 'Cairo'),
                unselectedLabelStyle: AppTextStyles.styleRegular16(context)
                    .copyWith(fontFamily: 'Cairo'),
                indicatorPadding: EdgeInsets.symmetric(
                  vertical: SizeConfig.h(7),
                  horizontal: SizeConfig.w(7),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerHeight: 0,
                labelColor: AppColors.kprimarycolor,
                unselectedLabelColor: const Color(0xff7B7B7B),
                indicator: BoxDecoration(
                  color: const Color(0xffCCE4F0),
                  borderRadius: BorderRadius.circular(10),
                ),
                tabs:  [
                  Tab(
                    child: TabWithCount(
                      title: 'الخدمات',
                      count: 3,
                    ),
                  ),
                  Tab(
                    child: TabWithCount(
                      title: 'الباقات',
                      count: 7,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// TabBarView
          SliverFillRemaining(
            child: TabBarView(
              children: [
                Center(
                  child: Text(
                    'محتوى الخدمات',
                    style: AppTextStyles.styleMedium16(context),
                  ),
                ),
                Center(
                  child: Text(
                    'محتوى الباقات',
                    style: AppTextStyles.styleMedium16(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

