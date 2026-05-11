import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/domain/entities/user_details_entity.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/uers_cubit.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/users_state.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';
import 'package:plupool/features/rating/presentation/manager/cubits/rating_cubit/ratings_cubit.dart';
import 'package:plupool/features/rating/presentation/manager/cubits/rating_cubit/ratings_state.dart';
import 'package:plupool/features/rating/presentation/views/widgets/customer_rating_view_body.dart';

class CustomerRating extends StatefulWidget {
  const CustomerRating({super.key, required this.user});
  final UserDetailsEntity user;

  @override
  State<CustomerRating> createState() => _CustomerRatingState();
}

class _CustomerRatingState extends State<CustomerRating> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          key: scaffoldkey,
          appBar: CustomAppBar(
            isSearch: false,
            onPressed: () {
              scaffoldkey.currentState!.openDrawer();
            },
          ),
          drawer: AppDrawer(),
          body: BlocListener<RatingsCubit, RatingsState>(
            listener: (context, state) {
              /// بعد نجاح الحذف
              if (state is RatingsDeleteSuccess) {
                /// هات البيانات الجديدة
                context.read<UsersCubit>().getUserDetails(widget.user.user.id);
              }
            },

            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(13),
                vertical: SizeConfig.h(15),
              ),

              child: BlocBuilder<UsersCubit, UsersState>(
                builder: (context, state) {
                  if (state is UserDetailsSuccess) {
                    return CustomerRatingViewBody(
                      userRating: state.user.ratings,
                    );
                  }

                  return CustomerRatingViewBody(
                    userRating: widget.user.ratings,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
