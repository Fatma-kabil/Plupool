class GetUserBookingsParams {
  final int userId;
  final String? status;
  final String? bookingType;
  final int page;
  final int pageSize;

  GetUserBookingsParams({
    required this.userId,
    this.status,
    this.bookingType,
    this.page = 1,
    this.pageSize = 10,
  });
}