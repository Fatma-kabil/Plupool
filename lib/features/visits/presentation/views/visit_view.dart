import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';
import 'package:plupool/features/visits/presentation/manager/visits-cubit/booking_visits_cubit.dart';
import 'package:plupool/features/visits/presentation/views/widgets/visits_view_body.dart';
class VisitView extends StatefulWidget {
  const VisitView({
    super.key,
    required this.bookingId,
  });

  final int bookingId;

  @override
  State<VisitView> createState() => _VisitViewState();
}

class _VisitViewState extends State<VisitView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    context.read<BookingVisitsCubit>().getBookingVisits(
          bookingId:200
          // widget.bookingId,
        );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          appBar: CustomAppBar(
         //   isSearch: true,
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          drawer: AppDrawer(),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(13),
              vertical: SizeConfig.h(15),
            ),
            child: VisitsViewBody(
            //  bookingId: widget.bookingId,
            ),
          ),
        ),
      ),
    );
  }
}