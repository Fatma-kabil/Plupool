class ProductParams {
  final List<int>? categoryIds;
  final String? sortBy;
  final String? search;

  const ProductParams({this.categoryIds, this.sortBy, this.search});

  Map<String, dynamic> toQuery() {
    return {
      if (categoryIds != null) "category_ids": categoryIds,
      if (sortBy != null) "sort_by": sortBy,
      if (search != null) "search": search,
    };
  }
}
