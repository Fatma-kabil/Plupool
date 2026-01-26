import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/packages/presentation/views/widgets/admin_package_card.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/rearrangment_row.dart';

class AdminPackagesSection extends StatefulWidget {
  const AdminPackagesSection({super.key});

  @override
  State<AdminPackagesSection> createState() => _AdminPackagesSectionState();
}

class _AdminPackagesSectionState extends State<AdminPackagesSection> {
  String selected = "عاجله";

  @override
  Widget build(BuildContext context) {
    final filteredServices = packages.where((service) {
      switch (selected) {
        case "مكتمله":
          return service.status == RequestStatus.completed;
        case "مجدوله":
          return service.status == RequestStatus.scheduled;
        case "قيد النتفيذ":
          return service.status == RequestStatus.inProgress;
        default:
          return true;
      }
    }).toList();

    return Column(
      children: [
        RearragnmentRow(
          selected: selected,
          onChanged: (val) {
            setState(() {
              selected = val;
            });
          },
          onTap: () {
         //   context.push('/addcustomerserviceview');
          },
        ),
        SizedBox(height: SizeConfig.h(15)),

        /// الكروت
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredServices.length,
          itemBuilder: (context, index) {
            return AdminPackageCard(model: filteredServices[index],);
          },
        ),
      ],
    );
  }
}
