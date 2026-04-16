class ProductParams {
  final List<int>? categoryIds;
  final String? sortBy;

  const ProductParams({this.categoryIds, this.sortBy});

  Map<String, dynamic> toQuery() {
    return {
      if (categoryIds != null) "category_ids": categoryIds,
      if (sortBy != null) "sort_by": sortBy,
    };
  }
}
