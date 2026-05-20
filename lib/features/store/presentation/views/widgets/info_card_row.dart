// widgets/info_cards_row.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/tech_info_card_row_shimmer.dart';
import 'package:plupool/features/store/presentation/cubits/store_statistics_cubit/store_statistics_cubit.dart';
import 'package:plupool/features/store/presentation/cubits/store_statistics_cubit/store_statistics_state.dart';
import '../../../../../core/utils/widgets/metric_card.dart';

class InfoCardsRow extends StatefulWidget {
  const InfoCardsRow({super.key});

  @override
  State<InfoCardsRow> createState() => _InfoCardsRowState();
}

class _InfoCardsRowState extends State<InfoCardsRow> {
  @override
void initState() {
  super.initState();

  context.read<StoreStatisticsCubit>().getStoreStatistics();
}
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreStatisticsCubit, StoreStatisticsState>(
      builder: (context, state) {
        print("STATE => ${state.runtimeType}");
        /// 🔄 Loading
        if (state is StoreStatisticsLoading) {
          return const TechInfoCardRowShimmer();
        }
        if (state is StoreStatisticsError) {
          return ErrorText(message: state.message);
        }

        /// ✅ Success
        if (state is StoreStatisticsSuccess) {
          final stats = [
            {"rating": state.data.rating},
            {"totalOrders": state.data.totalOrders},
            {"totalProducts": state.data.totalProducts},
            {"value": state.data.activeOffers},
          ];
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: MetricCard(
                  icon: Icons.star,
                  iconColor: const Color(0xffFF9F1C),
                  value: stats[0]["rating"].toString(),
                  label: 'التقييم',
                ),
              ),

              SizedBox(width: SizeConfig.w(5)),

              Expanded(
                flex: 1,
                child: MetricCard(
                  icon: Icons.storefront_outlined,
                  iconColor: const Color(0xff05B285),
                  value: stats[2]["totalProducts"].toString(),
                  label: 'منتج',
                ),
              ),

              SizedBox(width: SizeConfig.w(5)),
              Expanded(
                flex: 1,
                child: MetricCard(
                  icon: Icons.local_shipping_outlined,
                  iconColor: const Color(0xff00B4D8),
                  value: "24 س",
                  label: 'توصيل',
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
