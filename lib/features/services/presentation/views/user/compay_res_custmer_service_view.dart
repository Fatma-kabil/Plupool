import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/services/presentation/views/user/widgets/compay_res_custmer_service_view.dart';

class CompayResCustmerServiceView extends StatefulWidget {
  const CompayResCustmerServiceView({super.key});

  @override
  State<CompayResCustmerServiceView> createState() =>
      _CompayResCustmerServiceViewState();
}

class _CompayResCustmerServiceViewState
    extends State<CompayResCustmerServiceView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.h(20),
              left: SizeConfig.w(12),
              right: SizeConfig.w(12),
            ),
            child: CompayResCustmerServiceViewBody(),
          ),
        ),
      ),
    );
  }
}
