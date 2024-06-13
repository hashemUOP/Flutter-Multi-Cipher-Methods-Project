class CaesarCipher {
  int shift;

  CaesarCipher(this.shift);

  String encrypt(String text) {
    String result = '';
    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      if (char.toUpperCase() == char.toLowerCase()) {
        // Character is not a letter
        result += char;
      } else {
        int asciiValue = text.codeUnitAt(i);
        if (char.toUpperCase() == char) {
          // Character is upper case
          int encryptedChar = ((asciiValue - 65 + shift) % 26) + 65;
          result += String.fromCharCode(encryptedChar);
        } else {
          // Character is lower case
          int encryptedChar = ((asciiValue - 97 + shift) % 26) + 97;
          result += String.fromCharCode(encryptedChar);
        }
      }
    }
    return result;
  }

  String decrypt(String text) {
    String result = '';
    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      if (char.toUpperCase() == char.toLowerCase()) {
        // Character is not a letter
        result += char;
      } else {
        int asciiValue = text.codeUnitAt(i);
        if (char.toUpperCase() == char) {
          // Character is upper case
          int decryptedChar = ((asciiValue - 65 - shift + 26) % 26) + 65;
          result += String.fromCharCode(decryptedChar);
        } else {
          // Character is lower case
          int decryptedChar = ((asciiValue - 97 - shift + 26) % 26) + 97;
          result += String.fromCharCode(decryptedChar);
        }
      }
    }
    return result;
  }
}
