import 'package:flutter/material.dart';
import 'package:plupool/core/utils/widgets/custom_back_button.dart';
import 'package:plupool/features/services/data/models/pool_model.dart';
import 'package:plupool/features/services/presentation/views/widgets/pool_reserved_header_card.dart';

class ReserveConstructionView extends StatelessWidget {
  const ReserveConstructionView({super.key, required this.pool});
  final PoolModel pool;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20,
            bottom: 5,
            top: 15,
          ),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topLeft, // لو عايزة الباك باتون يطلع يمين
                child: CustomBackButton(),
              ),
              SizedBox(height: 15),
              PoolReserveHeaderCard(
                title: pool.title,

                description: pool.description,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
