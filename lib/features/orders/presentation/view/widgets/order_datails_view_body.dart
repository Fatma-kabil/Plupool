import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/orders/domain/entities/order_entity.dart';
import 'package:plupool/features/orders/presentation/manager/order_cubit.dart/order_cubit.dart';
import 'package:plupool/features/orders/presentation/manager/order_cubit.dart/order state.dart';
import 'package:plupool/features/orders/presentation/view/widgets/order_details_shimmer.dart';
import 'package:plupool/features/orders/presentation/view/widgets/order_details_view_body_middle_section.dart';
import 'package:plupool/features/orders/presentation/view/widgets/order_details_view_footer.dart';
import 'package:plupool/features/orders/presentation/view/widgets/status_and_note_section.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_datails_view_header.dart';

class OrderDatailsViewBody extends StatelessWidget {
  const OrderDatailsViewBody({super.key, required this.model});

  final OrderEntity model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {
        if (state is OrdersDeleteSuccess) {
          showCustomSnackBar(
            context: context,
            message: 'تم حذف المنتج بنجاح',
            isSuccess: true,
          );
          Navigator.pop(context);
        }

        if (state is OrderUpdateSuccess) {
          showCustomSnackBar(
            context: context,
            message: 'تم تحديث الطلب بنجاح',
            isSuccess: true,
          );
        }

        if (state is OrdersDeleteError || state is OrderUpdateError) {
          final msg = (state as dynamic).message;
          showCustomSnackBar(
            context: context,
            message: msg,
            isSuccess: false,
          );
        }
      },

      builder: (context, state) {
        /// ✅ SHIMMER
        if (state is OrderDetailsLoading) {
          return const OrderDetailsShimmer();
        }

        

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MessageDatailsViewHeader(
                name: model.userName,
                phone: model.userPhone,
                status: model.userIsActive,
                imageUrl: model.userImage,
                location: model.deliveryAddress,
              ),

              const SizedBox(height: 25),

              OrderDetailsViewBodyMiddleSection(model: model),

              const SizedBox(height: 25),

              StatusAndNoteSection(statu: model.status),

              const SizedBox(height: 25),

              OrderDetailsViewFooter(
                editfun: () {
                   context.read<OrdersCubit>().updateOrder(id:model.id ,notes: ,status: );
                },
                deleteFun: () {
                  context.read<OrdersCubit>().deleteOrder(data.id);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}