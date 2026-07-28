import 'package:plupool/features/myPool/data/models/client_model.dart';
import 'package:plupool/features/myPool/data/models/pool_details_model.dart';
import 'package:plupool/features/myPool/data/models/pool_item_model.dart';
import 'package:plupool/features/myPool/data/models/stats_model.dart';
import 'package:plupool/features/myPool/domain/entities/company_pool_entity.dart';
import 'package:plupool/features/notes/data/models/note_model.dart';

class CompanyPoolModel extends CompanyPoolEntity {
  const CompanyPoolModel({
    required super.total,
    required super.filteredCount,
    required super.returned,
    required super.limit,
    required super.stats,
    required super.items,
    required super.client,
    super.poolDetails,
    required super.notesTotal,
    required super.notes,
  });factory CompanyPoolModel.fromJson(Map<String, dynamic> json) {
  print("START COMPANY MODEL");

  print("stats");
  final stats = StatsModel.fromJson(json['stats'] ?? {});

  print("items");
  final items = (json['items'] as List<dynamic>? ?? [])
      .map((e) => PoolItemModel.fromJson(e))
      .toList();

  print("client");
  final client = ClientModel.fromJson(json['client'] ?? {});

  print("pool");
  final pool = json['pool_details'] == null
      ? null
      : PoolDetailsModel.fromJson(json['pool_details']);

  print("notes");
  final notes = (json['notes'] as List<dynamic>? ?? [])
      .map((e) => NoteModel.fromJson(e))
      .toList();

  print("DONE");

  return CompanyPoolModel(
    total: json['total'] ?? 0,
    filteredCount: json['filtered_count'] ?? 0,
    returned: json['returned'] ?? 0,
    limit: json['limit'] ?? 0,
    stats: stats,
    items: items,
    client: client,
    poolDetails: pool,
    notesTotal: json['notes_total'] ?? 0,
    notes: notes,
  );
}
  CompanyPoolEntity toEntity() => this;
}