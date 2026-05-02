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

class OrderDatailsViewBody extends StatefulWidget {
  const OrderDatailsViewBody({super.key, required this.model});

  final OrderEntity model;

  @override
  State<OrderDatailsViewBody> createState() => _OrderDatailsViewBodyState();
}

class _OrderDatailsViewBodyState extends State<OrderDatailsViewBody> {
  late String _status;
  final TextEditingController _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _status = widget.model.status;
  }

  /// 🔥 الحل الأساسي للمشكلة
  @override
  void didUpdateWidget(covariant OrderDatailsViewBody oldWidget) {
    super.didUpdateWidget(oldWidget);

    _status = widget.model.status;
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {
        if (state is OrdersDeleteSuccess) {
          showCustomSnackBar(
            context: context,
            message: 'تم حذف الطلب بنجاح',
            isSuccess: true,
          );
          Future.delayed(const Duration(milliseconds: 300), () {
            Navigator.pop(context);
          });
        }
        if (state is OrderUpdateSuccess) {
          showCustomSnackBar(
            context: context,
            message: 'تم تحديث الطلب بنجاح',
            isSuccess: true,
          );

          Future.delayed(const Duration(milliseconds: 300), () {
            Navigator.pop(context);
          });
        }

        if (state is OrdersDeleteError || state is OrderUpdateError) {
          final msg = (state as dynamic).message;
          showCustomSnackBar(context: context, message: msg, isSuccess: false);
        }
      },

      builder: (context, state) {
        /// 🔥 SHIMMER

        final data = state is OrderDetailsSuccess ? state.order : widget.model;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              MessageDatailsViewHeader(
                name: data.userName,
                phone: data.userPhone,
                status: data.userIsActive,
                imageUrl: data.userImage,
                location: data.deliveryAddress,
              ),

              const SizedBox(height: 25),

              /// ITEMS
              OrderDetailsViewBodyMiddleSection(model: data),

              const SizedBox(height: 25),

              /// STATUS + NOTES
              StatusAndNoteSection(
                status: _status,
                notesController: _notesController,
                onStatusChanged: (val) {
                  setState(() {
                    _status = val;
                  });
                },
              ),

              const SizedBox(height: 25),

              /// FOOTER
              OrderDetailsViewFooter(
                editfun: () {
                  context.read<OrdersCubit>().updateOrder(
                    id: data.id,
                    status: _status,
                    notes: _notesController.text,
                  );
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
