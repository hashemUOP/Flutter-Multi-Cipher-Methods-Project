class AffineCipher {
  String encrypt(String text, int a, int b) {
    String encryptedText = '';
    for (int i = 0; i < text.length; i++) {
      int charCode = text.codeUnitAt(i);
      if (isAlphabetic(charCode)) {
        int base = isUpperCase(charCode) ? 65 : 97;
        charCode = ((a * (charCode - base) + b) % 26) + base;
      }
      encryptedText += String.fromCharCode(charCode);
    }
    return encryptedText;
  }

  String decrypt(String text, int a, int b) {
    String decryptedText = '';
    int aInverse = findInverse(a);
    for (int i = 0; i < text.length; i++) {
      int charCode = text.codeUnitAt(i);
      if (isAlphabetic(charCode)) {
        int base = isUpperCase(charCode) ? 65 : 97;
        charCode = ((aInverse * (charCode - base - b)) % 26);
        if (charCode < 0) charCode += 26;
        charCode += base;
      }
      decryptedText += String.fromCharCode(charCode);
    }
    return decryptedText;
  }

  bool isAlphabetic(int charCode) {
    return (charCode >= 65 && charCode <= 90) ||
        (charCode >= 97 && charCode <= 122);
  }

  bool isUpperCase(int charCode) {
    return charCode >= 65 && charCode <= 90;
  }

  int findInverse(int a) {
    for (int i = 1; i < 26; i++) {
      if ((a * i) % 26 == 1) {
        return i;
      }
    }
    return -1; // Inverse doesn't exist
  }
}