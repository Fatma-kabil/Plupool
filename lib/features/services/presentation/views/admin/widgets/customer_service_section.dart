import 'package:flutter/widgets.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/customer_service_card.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/rearrangment_row.dart';

class CustomerServiceSection extends StatelessWidget {
  const CustomerServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RearragnmentRow(),
        SizedBox(height: SizeConfig.h(15)),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
            itemCount: customerServices.length,
            itemBuilder: (context, index) {
              return CustomerServiceCard(request: customerServices[index]);
            },
          ),
        ),
      ],
    );
  }
}
