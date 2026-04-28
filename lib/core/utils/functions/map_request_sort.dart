String? mapSort(String value) {
  switch (value) {
    case "جديد":
      return "new";

    case "تم التواصل":
      return "contacted";


    default:
      return null;
  }
}