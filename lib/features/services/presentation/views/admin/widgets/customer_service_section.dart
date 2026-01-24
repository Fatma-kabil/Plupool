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

    return Column(
      children: [
        RearragnmentRow(
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
        SizedBox(height: SizeConfig.h(15)),

        /// الكروت
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredServices.length,
          itemBuilder: (context, index) {
            return CustomerServiceCard(request: filteredServices[index]);
          },
        ),
      ],
    );
  }
}
