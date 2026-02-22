import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_offer_btn.dart';
import 'package:plupool/features/profile/data/models/faq_item.dart';
import 'package:plupool/features/settening/presentation/views/widgets/faq_card.dart';

class FaqPage extends StatefulWidget {
  final List<FaqItem> items;

  const FaqPage({super.key, required this.items});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  late List<bool> expanded;
  late List<bool> hidden;

  @override
  void initState() {
    super.initState();
    expanded = List.generate(widget.items.length, (_) => false);
    hidden = List.generate(widget.items.length, (_) => false);
  }

  void toggle(int index) {
    setState(() {
      expanded[index] = !expanded[index];
    });
  }

  void toggleHide(int index) {
    setState(() {
      hidden[index] = !hidden[index];
       print('Faq ${index} hidden = ${hidden[index]}'); // 👈 للتأكد
    });
  }
  @override
void didUpdateWidget(covariant FaqPage oldWidget) {
  super.didUpdateWidget(oldWidget);

  if (oldWidget.items.length != widget.items.length) {
    hidden = List.generate(widget.items.length, (_) => false);
    expanded = List.generate(widget.items.length, (_) => false);
  }
}

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: SizeConfig.h(12)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AddOfferBtn(text: "إضافة سؤال", onTap: () {}),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: widget.items.length,
            (context, index) {
              return FaqCard(
                item: widget.items[index],
                isExpanded: expanded[index],
                isHidden: hidden[index],
                onToggle: () => toggle(index),

                onToggleHide: () => toggleHide(index),
              );
            },
          ),
        ),
      ],
    );
  }
}
