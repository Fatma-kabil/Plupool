import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/myPool/presentation/views/manager/company_pool_cubit/comapny_pool_cubit.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/company_cus_visits.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/company_res_service_section.dart';

class CompanyContantCard extends StatefulWidget {
  const CompanyContantCard({super.key});

  @override
  State<CompanyContantCard> createState() => _CompanyContantCardState();
}

class _CompanyContantCardState extends State<CompanyContantCard> {
  int currentIndex = 0;

  void _changeTab(int i) {
    setState(() {
      currentIndex = i;
    });

    final cubit = context.read<CompanyPoolCubit>();

    if (i == 0) {
      cubit.getCompanyPools(
        clientId: 1,
        tab: 'services',
        status: 'scheduled',
        limit: 100,
      );
    } else {
      cubit.getCompanyPools(
        clientId: 1,
        tab: 'packages',
        bookingType: 'maintenance_package',
        status: 'scheduled',
        limit: 100,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: SizeConfig.h(45),
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
              onTap: _changeTab,
              labelStyle: AppTextStyles.styleMedium16(
                context,
              ).copyWith(fontFamily: 'Cairo'),
              unselectedLabelStyle: AppTextStyles.styleMedium16(
                context,
              ).copyWith(fontFamily: 'Cairo'),
              labelPadding: EdgeInsets.symmetric(horizontal: SizeConfig.w(20)),
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
              tabs: const [
                Tab(text: 'الخدمات'),
                Tab(text: 'الزيارات'),
              ],
            ),
          ),

          SizedBox(height: SizeConfig.h(20)),

          Offstage(
            offstage: currentIndex != 0,
            child: const CompanyResServiceSection(),
          ),

          Offstage(
            offstage: currentIndex != 1,
            child: const CompanyCusVisits(),
          ),
        ],
      ),
    );
  }
}
