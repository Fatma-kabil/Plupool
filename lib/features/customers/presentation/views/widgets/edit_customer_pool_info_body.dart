import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/customers/domain/entities/user_pool_entity.dart';
import 'package:plupool/features/customers/presentation/manager/user_pool_cubit/user_pool_cubit.dart';
import 'package:plupool/features/customers/presentation/manager/user_pool_cubit/user_pool_state.dart';
import 'package:plupool/features/customers/presentation/views/widgets/edit_customer_pool_info_form.dart';

class EditCustomerPoolInfoBody extends StatefulWidget {
  const EditCustomerPoolInfoBody({
    super.key,
    required this.userId,
    required this.pool,
  });

  final int userId;
  final UserPoolEntity pool;

  @override
  State<EditCustomerPoolInfoBody> createState() =>
      _EditCustomerPoolInfoBodyState();
}

class _EditCustomerPoolInfoBodyState extends State<EditCustomerPoolInfoBody> {
  final _formKey = GlobalKey<FormState>();

  final poolWidthController = TextEditingController();
  final poolHeightController = TextEditingController();
  final poolLengthController = TextEditingController();
  final poolVolumeController = TextEditingController();

  late String selectedPoolTpe;

  @override
  void initState() {
    super.initState();

    // ✅ fill initial data (IMPORTANT)
    poolWidthController.text = widget.pool.widthMeters?.toString() ?? "";
    poolHeightController.text = widget.pool.depthMeters?.toString() ?? "";
    poolLengthController.text = widget.pool.lengthMeters?.toString() ?? "";
    poolVolumeController.text = widget.pool.volumeLiters?.toString() ?? "";

    selectedPoolTpe = widget.pool.poolTypeName ?? "اسكيمير";
  }

  @override
  void dispose() {
    poolWidthController.dispose();
    poolHeightController.dispose();
    poolLengthController.dispose();
    poolVolumeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PoolCubit, PoolState>(
      listenWhen: (previous, current) =>
          previous.isUpdating != current.isUpdating ||
          previous.error != current.error ||
          previous.data != current.data,

      listener: (context, state) {
        if (!state.isUpdating && state.error == null && state.data != null) {
          context.pop();
          showCustomSnackBar(
            context: context,
            message: "تم تحديث بيانات المسبح بنجاح",
            isSuccess: true,
          );
        }

        if (state.error != null) {
          showCustomSnackBar(
            context: context,
            message: state.error!,
            isSuccess: false,
          );
        }
      },

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditCustomerPoolInfoForm(
            formKey: _formKey,
            poolWidthController: poolWidthController,
            poolHeightController: poolHeightController,
            poolLengthController: poolLengthController,
            poolVolumeController: poolVolumeController,
            selectedPackage: selectedPoolTpe,
            onPoolChanged: (value) {
              setState(() => selectedPoolTpe = value!);
            },
          ),

          const SizedBox(height: 40),

          // 🔵 SAVE BUTTON
          CustomTextBtn(
            text: context.watch<PoolCubit>().state.isUpdating
                ? "جاري الحفظ..."
                : "حفظ التغيرات",
            width: double.infinity,
            padding: SizeConfig.h(8),
            textStyle: AppTextStyles.styleSemiBold18(
              context,
            ).copyWith(color: Colors.white),
            trailing: context.watch<PoolCubit>().state.isUpdating
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: SizeConfig.w(SizeConfig.isWideScreen ? 17 : 20),
                  ),
            onPressed: () {
              final form = _formKey.currentState;
              if (form == null || !form.validate()) return;

              // ✅ REQUIRED SAFE PARSING
              final width =
                  double.tryParse(poolWidthController.text.trim()) ?? 0;
              final depth =
                  double.tryParse(poolHeightController.text.trim()) ?? 0;
              final length =
                  double.tryParse(poolLengthController.text.trim()) ?? 0;
              final volume =
                  double.tryParse(poolVolumeController.text.trim()) ?? 0;

              // ❗ all required payload
              final body = <String, dynamic>{
                "width_meters": width,
                "depth_meters": depth,
                "length_meters": length,
                "volume_liters": volume,
                "pool_type_name": selectedPoolTpe,
              };

              context.read<PoolCubit>().updatePool(widget.userId, body);
            },
          ),

          const SizedBox(height: 15),

          CustomOutlinedBtn(
            text: " إلغاء",
            width: double.infinity,
            trailing: Icon(
              Icons.cancel_outlined,
              color: AppColors.kprimarycolor,
              size: SizeConfig.w(SizeConfig.isWideScreen ? 18 : 22),
            ),
            onPressed: () => context.pop(),
          ),
        ],
      ),
    );
  }
}
