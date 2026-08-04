class SendOtpResponseModel {
  final String message;
  final String phone;
  final int expiresIn;
  final String provider;
  final List<String> channels;

  const SendOtpResponseModel({
    required this.message,
    required this.phone,
    required this.expiresIn,
    required this.provider,
    required this.channels,
  });

  factory SendOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return SendOtpResponseModel(
      message: json['message'] ?? '',
      phone: json['phone'] ?? '',
      expiresIn: json['expires_in'] ?? 0,
      provider: json['provider'] ?? '',
      channels: json['channels'] != null
          ? List<String>.from(json['channels'])
          : [],
    );
  }
}