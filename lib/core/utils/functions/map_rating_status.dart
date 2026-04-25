String mapStatus(String value) {
  switch (value) {
    case "معلق":
      return "pending";
    case "موافق عليه":
      return "approved";
    case "مرفوض":
      return "rejected";
    default:
      return "pending";
  }
}