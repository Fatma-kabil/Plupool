import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_offer_btn.dart';

import 'package:plupool/features/settening/domain/entities/faq_entity.dart';
import 'package:plupool/features/settening/presentation/manager/cubits/faq_cubit/faq_cubit.dart';
import 'package:plupool/features/settening/presentation/views/widgets/add_ques_card.dart';
import 'package:plupool/features/settening/presentation/views/widgets/faq_card.dart';

class FaqPage extends StatefulWidget {
  final List<FaqEntity> items;
  final String role;

  const FaqPage({super.key, required this.items, required this.role});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  late List<bool> expanded;

  @override
  void initState() {
    super.initState();
    expanded = List.generate(widget.items.length, (_) => false);
  }

  void toggle(int index) {
    setState(() {
      expanded[index] = !expanded[index];
    });
  }

  @override
  void didUpdateWidget(covariant FaqPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.items.length != widget.items.length) {
      expanded = List.generate(widget.items.length, (_) => false);
    }
  }

  void _toggleVisibility(FaqEntity item) {
    context.read<FaqCubit>().toggleFaq(
          item.id!,
          !item.isActive,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isEmpty = widget.items.isEmpty;

    return CustomScrollView(
      slivers: [
        /// ➕ زرار الإضافة (دايمًا ظاهر)
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: SizeConfig.h(12)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AddOfferBtn(
                text: "إضافة سؤال",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        AddQuesCard(role: widget.role),
                  );
                },
              ),
            ),
          ),
        ),

        /// ❌ Empty state
        if (isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: ErrorText(
                message: "🤔 لا توجد أسئلة حالياً",
              ),
            ),
          )
        else

        /// 📋 List
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: widget.items.length,
            (context, index) {
              final item = widget.items[index];

              return FaqCard(
                item: item,
                isExpanded: expanded[index],

                /// 👇 isHidden جاي من API مباشرة
                isHidden: !item.isActive,

                onToggle: () => toggle(index),

                /// 👇 هنا بنستخدم الكيوبت
                onToggleHide: () => _toggleVisibility(item),
              );
            },
          ),
        ),
      ],
    );
  }
}