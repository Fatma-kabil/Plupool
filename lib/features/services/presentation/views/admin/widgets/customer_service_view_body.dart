import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/packages/presentation/views/widgets/admin_packages_section.dart';
import 'package:plupool/features/services/domain/entities/user_booking_entity.dart';
import 'package:plupool/features/services/presentation/manager/user_booking_cubit/user_booking_cubit.dart';
import 'package:plupool/features/services/presentation/manager/user_booking_cubit/user_booking_state.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/customer_service_section.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/tab_with_count.dart';

class CustomerServiceViewBody extends StatefulWidget {
  const CustomerServiceViewBody({super.key, required this.userId});

  final int userId;

  @override
  State<CustomerServiceViewBody> createState() =>
      _CustomerServiceViewBodyState();
}

class _CustomerServiceViewBodyState extends State<CustomerServiceViewBody> {
  @override
  void initState() {
    super.initState();

    context.read<UserBookingCubit>().getUserBookings(userId: widget.userId);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBookingCubit, UserBookingState>(
      builder: (context, state) {
        final isLoading = state is UserBookingLoading;
        final isError = state is UserBookingError;
        final isLoaded = state is UserBookingLoaded;

        final services = isLoaded ? state.services : <UserBookingEntity>[];
        final packages = isLoaded ? state.packages : <UserBookingEntity>[];

        return DefaultTabController(
          length: 2,
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
                  tabs: [
                    Tab(
                      child: TabWithCount(
                        title: 'الخدمات',
                        count: isLoaded ? services.length : 0,
                      ),
                    ),
                    Tab(
                      child: TabWithCount(
                        title: 'الباقات',
                        count: isLoaded ? packages.length : 0,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: SizeConfig.h(18)),

              /// TabBarView
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(6)),
                  child: TabBarView(
                    children: [
                      CustomerServiceSection(
                        bookings: services,
                        isLoading: isLoading,
                        isError: isError,
                      ),
                      AdminPackagesSection(
                        packages: packages,
                        isLoading: isLoading,
                        isError: isError,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
