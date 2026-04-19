import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/settening/presentation/manager/cubits/faq_cubit/faq_cubit.dart';
import 'package:plupool/features/settening/presentation/manager/cubits/faq_cubit/faq_state.dart';
import 'package:plupool/features/settening/presentation/views/widgets/faq_page.dart';
import 'package:plupool/features/settening/presentation/views/widgets/faq_shimmer_list.dart';

class AdminSettingViewBody extends StatefulWidget {
  const AdminSettingViewBody({super.key});

  @override
  State<AdminSettingViewBody> createState() => _AdminSettingViewBodyState();
}

class _AdminSettingViewBodyState extends State<AdminSettingViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    /// أول تحميل
    _loadFaqByIndex(0);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;
      _loadFaqByIndex(_tabController.index);
    });
  }

  void _loadFaqByIndex(int index) {
    final cubit = context.read<FaqCubit>();

    switch (index) {
      case 0:
        cubit.getFaqs(role: "pool_owner");
        break;
      case 1:
        cubit.getFaqs(role: "technician");
        break;
      case 2:
        cubit.getFaqs(role: "company");
        break;
    }
  }

  Widget _buildFaqContent({required String role}) {
    return BlocBuilder<FaqCubit, FaqState>(
      builder: (context, state) {
        if (state is FaqLoading) {
          return const FaqShimmerList();
        }

        if (state is FaqSuccess) {
          if (state.faqs.isEmpty) {
            return Center(child: ErrorText(message: "🤔 لا توجد أسئلة حالياً"));
          }

          return FaqPage(items: state.faqs, role: role);
        }

        if (state is FaqError) {
          return Center(child: ErrorText(message: state.message));
        }

        return const SizedBox();
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          /// TabBar
          Container(
            height: SizeConfig.h(SizeConfig.isWideScreen ? 55 : 44),
            margin: EdgeInsets.symmetric(horizontal: SizeConfig.w(6)),
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
              controller: _tabController,
              labelStyle: AppTextStyles.styleRegular16(
                context,
              ).copyWith(fontFamily: 'Cairo'),
              unselectedLabelStyle: AppTextStyles.styleRegular16(
                context,
              ).copyWith(fontFamily: 'Cairo'),
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
                Tab(child: Text("العملاء")),
                Tab(child: Text('الفنيين')),
                Tab(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('ممثلي الشركات'),
                  ),
                ),
              ],
            ),
          ),

          /// TabBarView
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(6),
                vertical: SizeConfig.h(18),
              ),
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildFaqContent(role: "pool_owner"),
                  _buildFaqContent(role: "technician"),
                  _buildFaqContent(role: "company"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
