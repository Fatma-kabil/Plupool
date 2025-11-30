import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/data/models/faq_item.dart';

class FaqSection extends StatefulWidget {
   FaqSection({super.key, required this.items});
  final List  <FaqItem> items;

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  List<bool> expanded = [];

  @override
  void initState() {
    expanded = List.generate(widget.items.length, (_) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
     

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ListView.separated(
        
        shrinkWrap: true, // مهم
        physics: NeverScrollableScrollPhysics(), // مهم
        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.w(15),vertical: SizeConfig.h(14)),
        itemBuilder: (context, index) {
          final item =widget.items[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              InkWell(
                onTap: () {
                  setState(() {
                    expanded[index] = !expanded[index];
                  });
                },
                child: Padding(
                  padding:  EdgeInsets.only(bottom: SizeConfig.h(8)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.question,
                          style: AppTextStyles.styleMedium16(
                            context,
                          ).copyWith(color: Color(0xff333333)),
                        ),
                      ),
                  
                      // السهم
                      AnimatedRotation(
                        duration: const Duration(milliseconds: 250),
                        turns: expanded[index] ? 0.5 : 0, // يفتح ويقفل
                        child: Icon(Icons.keyboard_arrow_down,color: Color(0xffA4A4A4),size: SizeConfig.w(18),),
                      ),
                    ],
                  ),
                ),
              ),

              // الإجابة
              if (expanded[index])
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.h(4),bottom:SizeConfig.h(4) ),
                  child: Text(
                    textDirection: TextDirection.rtl,
                    item.answer,
                    style: AppTextStyles.styleMedium16(
                      context,
                    ).copyWith(color: Color(0xff999999),height: 1.9),
                  ),
                ),
            ],
          );
        },
        separatorBuilder: (_, __) => SizedBox(height: SizeConfig.h(12)),
        itemCount:widget.items.length,
      ),
    );
  }
}
