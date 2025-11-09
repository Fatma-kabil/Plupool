import 'package:flutter/widgets.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/customer_info_card.dart';

class CustomerDetailsViewBody extends StatelessWidget {
  const CustomerDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      
      children: [
        CustomerInfoCard()
      ],
    );
  }
}
