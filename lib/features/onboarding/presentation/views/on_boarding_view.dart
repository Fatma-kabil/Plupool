import 'package:flutter/material.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  final PageController _controller = PageController();
  int index = 0;

  final List<Map<String, String>> data = [
    {
      "image": "assets/images/onboarding1.png",
      "title":
          "انشئ حمامك بطريقه حديثه و بمجموعة من المهندسين تتعدى خبرتهم عشرات السنين في السوق",
      "subtitle": "ننفّذ تصميمك بدقة مع محاكاة 3D قبل التنفيذ!",
    },
    {
      "image": "assets/images/onboarding2.png",
      "title":
          "صيانه مستمره من فنيين علي اعلي مستوى وتقييمات مستمره في التطبيق",
      "subtitle": "نقدم لك صيانة ذكية بضغطة زر وقت ما تحب",
    },
    {
      "image": "assets/images/onboarding3.png",
      "title":
          "شريكك الموثوق في إنشاء حمامات سباحة ذكية ، بدعم احترافي للمطورين العقاريين والمشروعات الكبرى",
      "subtitle": "!نقدّم لك صيانة وتنظيف ذكي بضغطة زر، وقت ما تحب",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (value) {
                setState(() => index = value);
              },
              itemCount: data.length,
              itemBuilder: (context, i) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        data[i]["image"]!,
                        width: double.infinity,
                        fit: BoxFit.cover, // يحافظ على نسبة أبعاد الصورة
                        // تصغير النسبة
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 38,
                          right: 38,
                          bottom: 100,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              data[i]["title"]!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              data[i]["subtitle"]!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          //   const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              data.length,
              (i) => AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 27,
                height: 8,
                decoration: BoxDecoration(
                  color: index == i
                      ? const Color(0xFF12A0FF)
                      : Color(0xffE4E4E4),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        if (index < data.length - 1) {
                          _controller.animateToPage(
                            index + 1,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        "التالي",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF12A0FF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // تخطي
                      },
                      child: Text(
                        "تخطي",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xffB3B3B3),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
