String normalizeArabicNumbers(String input) {
  const arabic = ['٠','١','٢','٣','٤','٥','٦','٧','٨','٩'];
  const english = ['0','1','2','3','4','5','6','7','8','9'];

  for (int i = 0; i < arabic.length; i++) {
    input = input.replaceAll(arabic[i], english[i]);
  }
  return input;
}

String toArabicNumbers(String input) {
  const map = {
    '0': '٠',
    '1': '١',
    '2': '٢',
    '3': '٣',
    '4': '٤',
    '5': '٥',
    '6': '٦',
    '7': '٧',
    '8': '٨',
    '9': '٩',
  };

  return input.split('').map((e) => map[e] ?? e).join();
}