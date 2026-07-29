import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/myPool/presentation/views/manager/company_pool_cubit/comapny_pool_cubit.dart';
import 'package:plupool/features/myPool/presentation/views/manager/company_pool_cubit/company_pool_state.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/company_contant_card.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/company_cus_pool_info_row.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/company_pool_header_shimmer.dart';

class CompanyRsCusPoolViwBody extends StatelessWidget {
  const CompanyRsCusPoolViwBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<CompanyPoolCubit, CompanyPoolState>(
            builder: (context, state) {
              if (state is CompanyPoolLoading) {
                return CompanyPoolHeaderShimmer();
              }

              if (state is CompanyPoolFailure) {
                return Center(child: ErrorText(message: state.message));
              }

              if (state is! CompanyPoolSuccess) {
                return const SizedBox();
              }

              final companyPool = state.data.poolDetails;

              return Stack(
                children: [
                  SizedBox(
                    height: SizeConfig.h(
                      SizeConfig.screenHeight >= SizeConfig.screenWidth * 2
                          ? 375
                          : 425,
                    ),
                    child: Image.asset(
                      'assets/images/pool_background.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),

                  Positioned(
                    top: SizeConfig.h(170),
                    left: SizeConfig.w(15),
                    right: SizeConfig.w(15),
                    child: CompanyCusPoolInfoRow(poolDetails: companyPool),
                  ),

                  Positioned(
                    top: SizeConfig.h(
                      SizeConfig.screenHeight >= SizeConfig.screenWidth * 2
                          ? 290
                          : 320,
                    ),
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.kScaffoldColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: SizeConfig.w(18),
                          top: SizeConfig.h(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.data.client.fullName,
                              style: AppTextStyles.styleBold16(
                                context,
                              ).copyWith(color: AppColors.ktextcolor),
                            ),
                            SizedBox(height: SizeConfig.h(6)),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: SizeConfig.w(16),
                                  color: const Color(0xff777777),
                                ),
                                Expanded(
                                  child: Text(
                                    state.data.client.address,
                                    style: AppTextStyles.styleRegular13(
                                      context,
                                    ).copyWith(color: const Color(0xff777777)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          const DefaultTabController(length: 2, child: CompanyContantCard()),
        ],
      ),
    );
  }
}
