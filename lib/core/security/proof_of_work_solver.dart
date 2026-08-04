import 'dart:convert';
import 'dart:isolate';

import 'package:crypto/crypto.dart';

class ProofOfWorkSolver {
  static int solveProofOfWork({
    required String challenge,
    required int difficulty,
  }) {
    final requiredPrefix = '0' * difficulty;

    int nonce = 0;

    while (true) {
      final input = '$challenge:$nonce';

      final hash = sha256
          .convert(
            utf8.encode(input),
          )
          .toString();

      if (hash.startsWith(requiredPrefix)) {
        return nonce;
      }

      nonce++;
    }
  }

  static Future<int> solveAkedlyChallenge({
    required String challenge,
    required int difficulty,
  }) {
    return Isolate.run(
      () => solveProofOfWork(
        challenge: challenge,
        difficulty: difficulty,
      ),
    );
  }
}