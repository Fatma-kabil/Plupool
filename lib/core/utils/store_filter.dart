enum StoreFilter {
  all,
  discount,
  bestSeller,
  highPrice,
  lowPrice,
}

extension StoreFilterX on StoreFilter {
  String get label {
    switch (this) {
      case StoreFilter.all:
        return "الكل";
      case StoreFilter.discount:
        return "العروض";
      case StoreFilter.bestSeller:
        return "الأكثر مبيعا";
      case StoreFilter.highPrice:
        return "الأعلي سعرا";
      case StoreFilter.lowPrice:
        return "الأقل سعرا";
    }
  }
}
