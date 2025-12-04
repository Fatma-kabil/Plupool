import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/offer_model.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/owner_offer_card.dart';

class OwnerOfferCarusal extends StatefulWidget {
  final List<OfferModel> offers;
  const OwnerOfferCarusal({super.key, required this.offers});

  @override
  State<OwnerOfferCarusal> createState() => _OwnerOfferCarusalState();
}

class _OwnerOfferCarusalState extends State<OwnerOfferCarusal> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// PageView
        SizedBox(
          height: SizeConfig.screenHeight > 2 * SizeConfig.screenWidth
              ? SizeConfig.h(340)
              : SizeConfig.screenWidth == 800
              ? SizeConfig.h(420)
              : SizeConfig.screenWidth > 1000
              ? SizeConfig.w(300)
              : SizeConfig.screenWidth > 800
              ? SizeConfig.w(
                  320,
                ) // SizeConfig.screenHeight / SizeConfig.screenWidth * 0.60
              : SizeConfig.h(360),
          child: PageView.builder(
            padEnds: false,
            controller: _pageController,
            itemCount: widget.offers.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              final offer = widget.offers[index];
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  return OwnerOfferCard(offer: offer);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
