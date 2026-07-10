import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/booking_card.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/maintenance/domain/entities/maintenance_package_entity.dart';
import 'package:plupool/features/maintenance/presentation/manager/cubits/maintenance_package_cubit/maintenance_packag_state.dart';
import 'package:plupool/features/maintenance/presentation/manager/cubits/maintenance_package_cubit/maintenance_package_cubit.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/confirm_package_booking_card.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/package_card.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/package_card_shimmer.dart';

class ServicesPackagesSection extends StatefulWidget {
  const ServicesPackagesSection({super.key});

  @override
  State<ServicesPackagesSection> createState() =>
      _ServicesPackagesSectionState();
}

class _ServicesPackagesSectionState extends State<ServicesPackagesSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _currentIndex = 0;

  final List<String> _tabs = [
    "الباقة الشهرية",
    "الباقة (4 شهور)",
    "الباقة السنوية",
  ];

  final List<String> _durations = ["MONTHLY", "QUARTERLY","YEARLY" ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: _currentIndex,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MaintenancePackagesCubit>().getPackages(
        duration: _durations[_currentIndex],
      );
    });

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() => _currentIndex = _tabController.index);

        context.read<MaintenancePackagesCubit>().getPackages(
          duration: _durations[_currentIndex],
        );
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onSelectPackage(
    BuildContext context,
    MaintenancePackageEntity package,
  ) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => BookingCard(
        onConfirm: (date, time) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.all(16),
              child: ConfirmPackageBookingCard(
                date: date,
                time: time,
                packageType: package.nameAr,
                packageId: package.id,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),

        Text(
          "باقات الخدمات",
          style: AppTextStyles.styleBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),

        const SizedBox(height: 9),

        Text(
          "اختر خطة الصيانة المناسبة لاحتياجاتك",
          style: AppTextStyles.styleRegular16(
            context,
          ).copyWith(color: const Color(0xff777777)),
        ),

        SizedBox(height: SizeConfig.h(24)),

        _buildTabBar(),

        SizedBox(height: SizeConfig.h(24)),

        BlocBuilder<MaintenancePackagesCubit, MaintenancePackagesState>(
          builder: (context, state) {
            if (state is MaintenancePackagesLoading) {
              return const PackageCardShimmer();
            }

            if (state is MaintenancePackagesError) {
              return Center(child: ErrorText(message: state.message));
            }

            if (state is MaintenancePackagesLoaded) {
              if (state.packages.isEmpty) {
                return const Center(child: Text("لا توجد باقات"));
              }

              final package = state.packages.first;

              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                child: PackageCard(
                  key: ValueKey(package.id),
                  title: package.descriptionAr,
                  services: package.includedServices,
                  onSelect: () => _onSelectPackage(context, package),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      indicatorColor: AppColors.kprimarycolor,
      indicatorWeight: 2.5,
      labelColor: AppColors.kprimarycolor,
      unselectedLabelColor: const Color(0xffAAAAAA),
      labelStyle: TextStyle(
        fontFamily: 'Cairo',
        fontSize: SizeConfig.isWideScreen ? 22 : 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: 'Cairo',
        fontSize: SizeConfig.isWideScreen ? 22 : 12,
        fontWeight: FontWeight.w400,
      ),
      tabs: _tabs.map((t) => Tab(text: t)).toList(),
    );
  }
}
