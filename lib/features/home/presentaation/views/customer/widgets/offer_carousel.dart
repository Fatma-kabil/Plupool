import 'package:flutter/material.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/offer_card.dart';

import 'package:plupool/core/constants.dart';

class OffersCarousel extends StatefulWidget {
  const OffersCarousel({super.key});

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
    if (index >= 0 && index < offers.length) {
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
          height: 400,
          child: PageView.builder(
            controller: _pageController,
            itemCount: offers.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              final offer = offers[index];
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double scale = 1.0;
                  if (_pageController.position.haveDimensions) {
                    scale = (_pageController.page! - index).abs();
                    scale = (1 - (scale * 0.1)).clamp(0.9, 1.0);
                  }
                  return Transform.scale(
                    scale: scale,
                    child: OfferCard(offer: offer),
                  );
                },
              );
            },
          ),
        ),

        const SizedBox(height: 16),

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
            Row(
              children: List.generate(
                offers.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 12 : 8,
                  height: _currentPage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            ArrowButton(
              icon: Icons.arrow_forward,
              enabled: _currentPage < offers.length - 1,
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
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: enabled ? Colors.blue : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Icon(
          icon,
          color: enabled ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
