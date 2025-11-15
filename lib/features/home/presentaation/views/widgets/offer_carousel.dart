import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/offer_model.dart';
import 'package:plupool/features/home/presentaation/views/widgets/offer_card.dart';



class OffersCarousel extends StatefulWidget {
   final List <OfferModel> offers;
  const OffersCarousel({super.key, required this.offers});

  @override
  State<OffersCarousel> createState() => _OffersCarouselState();
}

class _OffersCarouselState extends State<OffersCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  void _goToPage(int index) {
    if (index >= 0 && index <widget.offers.length) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// PageView
        SizedBox(
          height: SizeConfig.isWideScreen? SizeConfig.w(300):SizeConfig.h(360),
          child: PageView.builder(
             padEnds: false,
            controller: _pageController,
            itemCount:widget.offers.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              final offer = widget.offers[index];
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                 
                  return OfferCard(offer: offer);
                },
              );
            },
          ),
        ),

       SizedBox(height:SizeConfig.h(16) ),

        /// Indicators + Arrows
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ArrowButton(
              icon: Icons.arrow_back,
              enabled: _currentPage > 0,
              onTap: () => _goToPage(_currentPage - 1),
            ),
            const SizedBox(width: 16),
           
            ArrowButton(
              icon: Icons.arrow_forward,
              enabled: _currentPage <widget.offers.length - 1,
              onTap: () => _goToPage(_currentPage + 1),
            ),
          ],
        )
      ],
    );
  }
}

class ArrowButton extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  const ArrowButton({
    super.key,
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Icon(
        icon,
        size: SizeConfig.w(18),
        color: enabled ? Color(0xff2B2B2B) : Color(0xff777777),
      ),
    );
  }
}
