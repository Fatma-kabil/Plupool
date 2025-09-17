import 'package:flutter/material.dart';
import 'splash_view.dart'; // لو اسم ملفك غير كده عدّل الاستيراد

class SplashWrapper extends StatelessWidget {
  const SplashWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // ✅ نخلي Flutter يرندر أول Frame الأول (فاضي أو ثابت)
      future: Future.delayed(Duration.zero),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // هنا نعرض SplashView الأصلي بتاعك بالأنيميشن
          return const SplashView();
        } else {
          // أول Frame → ثابت عشان ميبانش فلاش أو فاضي
          return const Scaffold(
            backgroundColor: Colors.white,
          );
        }
      },
    );
  }
}
