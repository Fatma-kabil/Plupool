import 'package:flutter/material.dart';

class AddOfferView extends StatelessWidget {
  const AddOfferView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
       
        body: Center(
          child: Text(
            'واجهة إضافة العرض',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}