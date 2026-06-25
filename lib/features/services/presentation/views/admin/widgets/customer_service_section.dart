import 'package:flutter/material.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/services/domain/entities/booking_entity.dart';
import 'package:plupool/features/services/domain/entities/user_booking_entity.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/customer_service_card.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/customr_service_card_shimmer.dart';

class CustomerServiceSection extends StatefulWidget {
  const CustomerServiceSection({
    super.key,
    required this.bookings,
    this.isLoading = false,
    this.isError = false,
  });

  final List<UserBookingEntity> bookings;
  final bool isLoading;
  final bool isError;

  @override
  State<CustomerServiceSection> createState() => _CustomerServiceSectionState();
}

class _CustomerServiceSectionState extends State<CustomerServiceSection> {
  String selected = "عاجله";

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /// 🔹 الفلتر (ثابت)
        SliverToBoxAdapter(
          child: FilterOption(
          value: selected,
          items:  ["مكتمله", "مجدوله", "عاجله"],
          onChanged: (val) {
              setState(() {
                selected = val!;
              });
            },
        ),
          
          
         
        ),

        SliverToBoxAdapter(child: SizedBox(height: SizeConfig.h(15))),

        /// 🔥 المحتوى (مكان الليست فقط)
        if (widget.isError)
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: ErrorText(message: "حصل خطأ في تحميل البيانات"),
            ),
          )
        else if (widget.isLoading)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const CustomerServiceCardShimmer(),
              childCount: 6,
            ),
          )
        else
          ..._buildList(),
      ],
    );
  }

  List<Widget> _buildList() {
    final filteredServices = widget.bookings.where((service) {
      final status = mapApiStatus(service.status);

      switch (selected) {
        case "مكتمله":
          return status == RequestStatus.completed;
        case "مجدوله":
          return status == RequestStatus.scheduled;
        case "قيد التنفيذ":
          return status == RequestStatus.inProgress;
        case "عاجله":
          return status == RequestStatus.urgent;
        default:
          return true;
      }
    }).toList();

    if (filteredServices.isEmpty) {
      return [
        const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: ErrorText(message: "لا توجد خدمات")),
        ),
      ];
    }

    return [
      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final booking = filteredServices[index];
          return CustomerServiceCard(
            booking: BookingEntity(
              id: booking.id,
              userName: booking.userName,
              userRole: booking.userRole,
              date: booking.date,
              time: booking.time,
              status: booking.status,
              bookingType: booking.bookingType,
              techniciansNames: booking.technicians??[],
              userId: booking.userId,
              techniciansIds: booking.techniciansIds??[]
              
            ),
          );
        }, childCount: filteredServices.length),
      ),
    ];
  }
}
