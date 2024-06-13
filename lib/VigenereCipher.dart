class VigenereCipher {
  String key;

  VigenereCipher(this.key);

  String encrypt(String plainText) {
    String encryptedText = '';
    String normalizedPlainText = plainText.replaceAll(' ', '').toUpperCase();
    key = key.replaceAll(' ', '').toUpperCase();
    int keyIndex = 0;

    for (int i = 0; i < plainText.length; i++) {
      if (!plainText[i].contains(RegExp(r'[A-Za-z]'))) {
        // If the character is not alphabetic, include it in the output without modification
        encryptedText += plainText[i];
        continue;
      }

      int shift = key.codeUnitAt(keyIndex % key.length) - 'A'.codeUnitAt(0);
      String encryptedChar;
      if (plainText[i].contains(RegExp(r'[A-Z]'))) {
        encryptedChar = String.fromCharCode(((plainText.codeUnitAt(i) - 'A'.codeUnitAt(0) + shift) % 26) + 'A'.codeUnitAt(0));
      } else {
        encryptedChar = String.fromCharCode(((plainText.codeUnitAt(i) - 'a'.codeUnitAt(0) + shift) % 26) + 'a'.codeUnitAt(0));
      }
      encryptedText += encryptedChar;
      keyIndex++;
    }
    return encryptedText;
  }

  String decrypt(String cipherText) {
    String decryptedText = '';
    String normalizedCipherText = cipherText.replaceAll(' ', '').toUpperCase();
    key = key.replaceAll(' ', '').toUpperCase();
    int keyIndex = 0;

    for (int i = 0; i < cipherText.length; i++) {
      if (!cipherText[i].contains(RegExp(r'[A-Za-z]'))) {
        // If the character is not alphabetic, include it in the output without modification
        decryptedText += cipherText[i];
        continue;
      }

      int shift = key.codeUnitAt(keyIndex % key.length) - 'A'.codeUnitAt(0);
      String decryptedChar;
      if (cipherText[i].contains(RegExp(r'[A-Z]'))) {
        decryptedChar = String.fromCharCode(((cipherText.codeUnitAt(i) - 'A'.codeUnitAt(0) - shift + 26) % 26) + 'A'.codeUnitAt(0));
      } else {
        decryptedChar = String.fromCharCode(((cipherText.codeUnitAt(i) - 'a'.codeUnitAt(0) - shift + 26) % 26) + 'a'.codeUnitAt(0));
      }
      decryptedText += decryptedChar;
      keyIndex++;
    }
    return decryptedText;
  }
}
