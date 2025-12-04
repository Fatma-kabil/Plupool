import 'package:flutter/cupertino.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/offer_model.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/offer_details_card.dart';

class OfferDetailsViewBody extends StatelessWidget {
  const OfferDetailsViewBody({super.key, required this.offers});
   final List<OfferModel> offers;

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: offers.length,
      itemBuilder: (context, index) {
        return Padding(
          padding:  EdgeInsets.only( bottom:  SizeConfig.h(12)),
          child: OfferDetailsCard(offer: offers[index],),
        );
      },
    );
  }
}
