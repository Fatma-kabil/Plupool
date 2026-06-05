import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/orders/presentation/manager/order_cubit.dart/order%20state.dart';
import 'package:plupool/features/orders/presentation/manager/order_cubit.dart/order_cubit.dart';
import 'package:plupool/features/orders/presentation/view/widgets/customer_order_details_shimmer.dart';
import 'package:plupool/features/orders/presentation/view/widgets/order_details_view_body_middle_section.dart';
import 'package:plupool/features/orders/presentation/view/widgets/order_details_view_footer.dart';
import 'package:plupool/features/orders/presentation/view/widgets/status_and_note_section.dart';
class CustomerOrderDetailsViewBody extends StatefulWidget {
  const CustomerOrderDetailsViewBody({
    super.key,
    required this.orderId,
  });

  final int orderId;

  @override
  State<CustomerOrderDetailsViewBody> createState() =>
      _CustomerOrderDetailsViewBodyState();
}

class _CustomerOrderDetailsViewBodyState
    extends State<CustomerOrderDetailsViewBody> {
  final TextEditingController _notesController =
      TextEditingController();

  String? _status;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrdersCubit>().getOrderDetails(
            widget.orderId,
          );
    });
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
        if (state is OrderUpdateSuccess) {
          showCustomSnackBar(
            context: context,
            message: 'تم تحديث الطلب بنجاح',
            isSuccess: true,
          );

          Navigator.pop(context);
        }

        if (state is OrdersDeleteSuccess) {
          showCustomSnackBar(
            context: context,
            message: 'تم حذف الطلب بنجاح',
            isSuccess: true,
          );

          Navigator.pop(context);
        }

        if (state is OrderDetailsError ||
            state is OrderUpdateError ||
            state is OrdersDeleteError) {
          showCustomSnackBar(
            context: context,
            message: (state as dynamic).message,
          );
        }

        if (state is OrderDetailsSuccess) {
          _status ??= state.order.status;

          if (_notesController.text.isEmpty) {
            _notesController.text =
                state.order.adminNotes ?? '';
          }
        }
      },

      builder: (context, state) {

        /// LOADING
        if (state is OrderDetailsLoading) {
          return CustomerOrderDetailsShimmer();
        }

        /// ERROR
        if (state is OrderDetailsError) {
          return Center(
            child: ErrorText(message: state.message),
          );
        }

        /// SUCCESS
        if (state is OrderDetailsSuccess) {
          final order = state.order;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                OrderDetailsViewBodyMiddleSection(
                  model: order,
                ),

                const SizedBox(height: 25),

                StatusAndNoteSection(
                  status: _status ?? order.status,
                  notesController: _notesController,
                  onStatusChanged: (val) {
                    setState(() {
                      _status = val;
                    });
                  },
                ),

                const SizedBox(height: 25),

                OrderDetailsViewFooter(
                  editfun: () {
                    context.read<OrdersCubit>().updateOrder(
                          id: order.id,
                          status: _status,
                          notes: _notesController.text,
                        );
                  },
                  deleteFun: () {
                    context.read<OrdersCubit>().deleteOrder(
                          order.id,
                        );
                  },
                ),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}