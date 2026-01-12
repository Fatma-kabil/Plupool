import 'package:flutter/widgets.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/support/presentation/views/widgets/messages_list.dart';

class AdminSupportViewBody extends StatefulWidget {
  const AdminSupportViewBody({super.key});

  @override
  State<AdminSupportViewBody> createState() => _AdminSupportViewBodyState();
}

class _AdminSupportViewBodyState extends State<AdminSupportViewBody> {
  String selected = "قيد المراجعه";

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: FilterOption(
            value: selected,
            items: const ["قيد المراجعه", "تم الحل"],
            onChanged: (val) {
              if (val != null) {
                setState(() {
                  selected = val;
                });
              }
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 18)),
         MessagesList(),
      ],
    );
  }
}
