import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/customer_service_card.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/rearrangment_row.dart';

class CustomerServiceSection extends StatefulWidget {
  const CustomerServiceSection({super.key});

  @override
  State<CustomerServiceSection> createState() => _CustomerServiceSectionState();
}

class _CustomerServiceSectionState extends State<CustomerServiceSection> {
  String selected = "عاجله";

  @override
  Widget build(BuildContext context) {
    final filteredServices = customerServices.where((service) {
      switch (selected) {
        case "مكتمله":
          return service.statu == RequestStatus.completed;
        case "مجدوله":
          return service.statu == RequestStatus.scheduled;
        case "عاجله":
          return service.statu == RequestStatus.urgent;
        default:
          return true;
      }
    }).toList();

    return CustomScrollView(
      slivers: [
        /// فلتر RearrangementRow
        SliverToBoxAdapter(
          child: RearragnmentRow(
            selected: selected,
            onChanged: (val) {
              setState(() {
                selected = val;
              });
            },
            onTap: () {
              context.push('/addcustomerserviceview');
            },
          ),
        ),

        SliverToBoxAdapter(
          child: SizedBox(height: SizeConfig.h(15)),
        ),

        /// الكروت
        filteredServices.isEmpty
            ? SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    "لا توجد خدمات",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              )
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return CustomerServiceCard(
                      request: filteredServices[index],
                    );
                  },
                  childCount: filteredServices.length,
                ),
              ),
      ],
    );
  }
}
