import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/packages/presentation/views/widgets/admin_package_card.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/customr_service_card_shimmer.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/rearrangment_row.dart';

import '../../../../services/domain/entities/user_booking_entity.dart';

class AdminPackagesSection extends StatefulWidget {
  const AdminPackagesSection({
    super.key,
    required this.packages,
    this.isLoading = false,
    this.isError = false,
  });

  final List<UserBookingEntity> packages;
  final bool isLoading;
  final bool isError;

  @override
  State<AdminPackagesSection> createState() =>
      _AdminPackagesSectionState();
}

class _AdminPackagesSectionState extends State<AdminPackagesSection> {
  String selected = 'قيد التنفيذ';

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /// 🔹 Filter
        SliverToBoxAdapter(
          child: RearragnmentRow(
            items: const ["مكتمله", "مجدوله", 'قيد التنفيذ'],
            selected: selected,
            onChanged: (val) {
              setState(() {
                selected = val;
              });
            },
            onTap: () {
              context.push('/addpackageview');
            },
          ),
        ),

        SliverToBoxAdapter(
          child: SizedBox(height: SizeConfig.h(15)),
        ),

        /// 🔥 STATES
        if (widget.isError)
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: ErrorText( message:  "حصل خطأ في تحميل الباقات"),
            ),
          )
        else if (widget.isLoading)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  const CustomerServiceCardShimmer(),
              childCount: 6,
            ),
          )
        else ..._buildList(),
      ],
    );
  }

  List<Widget> _buildList() {
   final filtered = widget.packages.where((package) {
  final status = mapApiStatus(package.status);

  switch (selected) {
    case "مكتمله":
      return status == RequestStatus.completed;

    case "مجدوله":
      return status == RequestStatus.scheduled;

    case "قيد التنفيذ":
      return status == RequestStatus.inProgress;

    default:
      return true;
  }
}).toList();
   

    if (filtered.isEmpty) {
      return const [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: ErrorText(message: "لا توجد باقات"),
          ),
        ),
      ];
    }

    return [
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            
            return AdminPackageCard(
              model: filtered[index],
            );
          },
          childCount: filtered.length,
        ),
      ),
    ];
  }
}