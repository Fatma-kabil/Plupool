class ProductParams {
  final int? categoryId;
  final String? sortBy;

  const ProductParams({this.categoryId, this.sortBy});

  Map<String, dynamic> toQuery() {
    return {
      if (categoryId != null) "category_id": categoryId,
      if (sortBy != null) "sort_by": sortBy,
    };
  }
}
