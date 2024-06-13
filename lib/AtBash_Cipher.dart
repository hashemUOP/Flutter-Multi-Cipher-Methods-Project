class AtbashCipher {
  static const String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  String encrypt(String input) {
    return _transform(input, true);
  }

  String decrypt(String input) {
    return _transform(input, false);
  }

  String _transform(String input, bool isEncrypt) {
    StringBuffer result = StringBuffer();
    for (int i = 0; i < input.length; i++) {
      String char = input[i];
      if (char.contains(RegExp(r'[A-Za-z]'))) {
        bool isUpperCase = char == char.toUpperCase();
        int index = alphabet.indexOf(char.toUpperCase());
        int reverseIndex = 25 - index;
        String reverseChar = alphabet[reverseIndex];
        result.write(isUpperCase ? reverseChar : reverseChar.toLowerCase());
      } else {
        result.write(char);
      }
    }
    return result.toString();
  }
}
