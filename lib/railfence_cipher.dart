class RailFenceCipher {
  // function to encrypt a message
  String encrypt(String text, int key) {
    // create the matrix to cipher
    // plain text key = rows ,
    // length(text) = columns
    // filling the rail matrix
    // to distinguish filled
    // spaces from blank ones
    List<List<String>> rail = List.generate(
        key, (index) => List<String>.filled(text.length, '\n'));

    // to find the direction
    bool dirDown = false;
    int row = 0, col = 0;

    for (int i = 0; i < text.length; i++) {
      // check the direction of flow
      // reverse the direction if we've just
      // filled the top or bottom rail
      if (row == 0 || row == key - 1) {
        dirDown = !dirDown;
      }

      // fill the corresponding alphabet
      rail[row][col] = text[i];
      col += 1;

      // find the next row using
      // direction flag
      if (dirDown) {
        row += 1;
      } else {
        row -= 1;
      }
    }

    // now we can construct the cipher
    // using the rail matrix
    List<String> result = [];
    for (int i = 0; i < key; i++) {
      for (int j = 0; j < text.length; j++) {
        if (rail[i][j] != '\n') {
          result.add(rail[i][j]);
        }
      }
    }
    return result.join();
  }

  // This function receives cipher-text
  // and key and returns the original
  // text after decryption
  String decrypt(String cipher, int key) {
    // create the matrix to cipher
    // plain text key = rows ,
    // length(text) = columns
    // filling the rail matrix to
    // distinguish filled spaces
    // from blank ones
    List<List<String>> rail = List.generate(
        key, (index) => List<String>.filled(cipher.length, '\n'));

    // to find the direction
    bool? dirDown;
    int row = 0, col = 0;

    // mark the places with '*'
    for (int i = 0; i < cipher.length; i++) {
      if (row == 0) {
        dirDown = true;
      }
      if (row == key - 1) {
        dirDown = false;
      }

      // place the marker
      rail[row][col] = '*';
      col += 1;

      // find the next row
      // using direction flag
      if (dirDown!) {
        row += 1;
      } else {
        row -= 1;
      }
    }

    // now we can construct the
    // fill the rail matrix
    int index = 0;
    for (int i = 0; i < key; i++) {
      for (int j = 0; j < cipher.length; j++) {
        if (rail[i][j] == '*' && index < cipher.length) {
          rail[i][j] = cipher[index];
          index += 1;
        }
      }
    }

    // now read the matrix in
    // zig-zag manner to construct
    // the resultant text
    List<String> result = [];
    row = 0;
    col = 0;
    for (int i = 0; i < cipher.length; i++) {
      // check the direction of flow
      if (row == 0) {
        dirDown = true;
      }
      if (row == key - 1) {
        dirDown = false;
      }

      // place the marker
      if (rail[row][col] != '*') {
        result.add(rail[row][col]!);
        col += 1;
      }

      // find the next row using
      // direction flag
      if (dirDown!) {
        row += 1;
      } else {
        row -= 1;
      }
    }
    return result.join();
  }
}