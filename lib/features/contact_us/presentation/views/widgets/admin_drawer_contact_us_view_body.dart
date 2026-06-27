import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/contact_us/presentation/views/widgets/contact_us_massage_list.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_cubit.dart';

class AdminDrawerContactUsViewBody extends StatefulWidget {
  const AdminDrawerContactUsViewBody({super.key});

  @override
  State<AdminDrawerContactUsViewBody> createState() => _AdminDrawerContactUsViewBodyState();
}
class _AdminDrawerContactUsViewBodyState
    extends State<AdminDrawerContactUsViewBody> {
  String selected = "جديد";

  String? get status {
    switch (selected) {
      case "قيد المراجعه":
        return "in_progress";
      case "تم الحل":
        return "resolved";
      default:
        return "pending_review";
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ContactCubit>().getMessages(
        type: "contact",
        status: status,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ابحث عن ممثل الشركه:",
                style: AppTextStyles.styleSemiBold16(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.w(4),
                  vertical: SizeConfig.h(20),
                ),
                child: CustomSearchPerson(
                  hintText: "ابحث بأسم ممثل الشركه او رقم الهاتف",
                  onChanged: (value) {
                    context.read<ContactCubit>().getMessages(
                          type: "contact",
                          status: status,
                          search: value,
                        );
                  },
                ),
              ),
              FilterOption(
                value: selected,
                items: const [
                  "تم الحل",
                  "قيد المراجعه",
                  "جديد",
                ],
                onChanged: (val) {
                  if (val != null) {
                    setState(() => selected = val);

                    context.read<ContactCubit>().getMessages(
                          type: "contact",
                          status: status,
                        );
                  }
                },
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 25)),
        const ContactUsMassageList(),
      ],
    );
  }

    
    
  }
    