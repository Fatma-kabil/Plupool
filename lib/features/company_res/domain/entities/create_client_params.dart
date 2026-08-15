class CreateClientParams {
  final int companyRepId;
  final String phone;
  final String countryCode;
  final String fullName;
  final String address;
  final bool isActive;

  CreateClientParams({
    required this.companyRepId,
    required this.phone,
    required this.countryCode,
    required this.fullName,
    required this.address,
    required this.isActive,
  });
}
