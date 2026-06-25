class ClientProjectsParams {
  final int clientId;
  final String? statusFilter;
  final int skip;
  final int limit;

  const ClientProjectsParams({
    required this.clientId,
    this.statusFilter,
    this.skip = 0,
    this.limit = 50,
  });

  Map<String, dynamic> toQuery() {
    return {
      if (statusFilter != null) 'status': statusFilter,
      'skip': skip,
      'limit': limit,
    };
  }
}