import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/promo_card.dart';

class PromoCarousel extends StatefulWidget {
  const PromoCarousel({super.key});

  @override
  State<PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<PromoCarousel> {
  PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // 👇 هنا نخلي الـ viewportFraction أقل من 1 عشان يبان جزء من الكارت اللي بعده
    _controller = PageController(viewportFraction: 0.88);
    initialPage:
    0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          //   width: SizeConfig.w(280),
          height: SizeConfig.h(200), // ارتفاع الكارد + margin
          child: PageView.builder(
            controller: _controller,
            itemCount: items.length,
            padEnds: false,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return PromoCard(model: items[index]);
            },
          ),
        ),
        const SizedBox(height: 12),

        // مؤشر الصفحات
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xffAAAAAA)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                items.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: _currentIndex == index
                      ? SizeConfig.w(8)
                      : SizeConfig.w(5),
                  height: _currentIndex == index
                      ? SizeConfig.h(8)
                      : SizeConfig.h(5),
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? AppColors.kprimarycolor
                        : Color(0xffD4D4D4),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
