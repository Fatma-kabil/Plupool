import 'package:plupool/features/myPool/domain/entities/pool_details_entity.dart';
import 'package:plupool/features/myPool/domain/entities/pool_item_entity.dart';
import 'package:plupool/features/myPool/domain/entities/stats_entity.dart';
import 'package:plupool/features/myPool/domain/entities/client_entity.dart';
import 'package:plupool/features/notes/domain/entities/note_entity.dart';

class CompanyPoolEntity {
  final int total;
  final int filteredCount;
  final int returned;
  final int limit;

  final StatsEntity stats;

  final List<PoolItemEntity> items;

  final ClientEntity client;

  final PoolDetailsEntity? poolDetails;

  final int notesTotal;

  final List<NoteEntity> notes;

  const CompanyPoolEntity({
    required this.total,
    required this.filteredCount,
    required this.returned,
    required this.limit,
    required this.stats,
    required this.items,
    required this.client,
    this.poolDetails,
    required this.notesTotal,
    required this.notes,
  });
}