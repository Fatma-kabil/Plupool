import 'package:flutter/material.dart';

import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/support/presentation/views/widgets/messages_list.dart';

class DrawerCustomerSection extends StatefulWidget {
  const DrawerCustomerSection({super.key});

  @override
  State<DrawerCustomerSection> createState() => _DrawerCustomerSectionState();
}

class _DrawerCustomerSectionState extends State<DrawerCustomerSection> {
    String selected = "قيد المراجعه";
  @override
  Widget build(BuildContext context) {
    return 
    CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
            "ابحث عن العميل:",
            style: AppTextStyles.styleSemiBold16(context),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(4),
              vertical: SizeConfig.h(20),
            ),
            child: CustomSearchPerson(
              hintText: "ابحث بأسم العميل او رقم الهاتف",
            ),
          ),
              FilterOption(
                value: selected,
                items: const [ "تم الحل","قيد المراجعه"],
                onChanged: (val) {
                  if (val != null) {
                    setState(() {
                      selected = val;
                    });
                  }
                },
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 25)),
         MessagesList(selected:selected ,),
      ],
    );
    
    
  }}  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    