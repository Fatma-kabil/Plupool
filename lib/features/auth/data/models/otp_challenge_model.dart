class TurnstileModel {
  final bool required;
  final String? siteKey;

  const TurnstileModel({
    required this.required,
    this.siteKey,
  });

  factory TurnstileModel.fromJson(Map<String, dynamic> json) {
    return TurnstileModel(
      required: json['required'] ?? false,
      siteKey: json['siteKey'],
    );
  }
}

class OtpChallengeModel {
  final bool challengeRequired;
  final String challengeToken;
  final String challenge;
  final int difficulty;
  final String expiresAt;
  final String algorithm;
  final TurnstileModel? turnstile;

  const OtpChallengeModel({
    required this.challengeRequired,
    required this.challengeToken,
    required this.challenge,
    required this.difficulty,
    required this.expiresAt,
    required this.algorithm,
    this.turnstile,
  });

  factory OtpChallengeModel.fromJson(Map<String, dynamic> json) {
    return OtpChallengeModel(
      challengeRequired: json['challengeRequired'] ?? false,
      challengeToken: json['challengeToken'] ?? '',
      challenge: json['challenge'] ?? '',
      difficulty: json['difficulty'] ?? 0,
      expiresAt: json['expiresAt'] ?? '',
      algorithm: json['algorithm'] ?? '',
      turnstile: json['turnstile'] != null
          ? TurnstileModel.fromJson(json['turnstile'])
          : null,
    );
  }
}