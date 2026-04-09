enum StoreFilter {
  
  price_low,
  price_high,
  best_selling,
  discount,
  
  
}
extension StoreFilterX on StoreFilter {
  String get apiValue {
    switch (this) {
      case StoreFilter.price_low: return "price_low";
      case StoreFilter.price_high: return "price_high";
      case StoreFilter.best_selling: return "best_selling";
      case StoreFilter.discount: return "discount";
    }
  }

  String get label {
    switch (this) {
      case StoreFilter.price_low: return "الأقل سعرا";
      case StoreFilter.price_high: return "الأعلى سعرا";
      case StoreFilter.best_selling: return "الأكثر مبيعا";
      case StoreFilter.discount: return "العروض";
    }
  }
}