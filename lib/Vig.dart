import 'package:flutter/material.dart';
import 'package:increment_decrement_form_field/increment_decrement_form_field.dart';
import 'package:nis/Affine_Cipher.dart';
import 'package:nis/Affine_Explain.dart';
import 'package:nis/AtBashExplain.dart';
import 'package:nis/AtBash_Cipher.dart';
import 'package:nis/VigenereCipher.dart';
import 'package:nis/VigenereExplain.dart';
import 'package:nis/caesar_cipher.dart';
import 'package:nis/railfence_cipher.dart';
import 'package:nis/text_box.dart';
import 'CaesarExplain.dart';
import 'RailExplain.dart';


class VIG extends StatefulWidget {
  const VIG({super.key});

  @override
  State<VIG> createState() => _VIGState();
}

class _VIGState extends State<VIG> {
  //is rail fence container active
  bool _isActive = false;

  //CONTROLLERS OF TEXTFIELDS

  final TextEditingController kController = TextEditingController();
  //This controller is used for the TextField where the user enters the key for the Vigenere Cipher.

  final TextEditingController pController = TextEditingController();
  //This controller is used for the main input TextField where the user enters the plaintext (if encoding) or the cipher text (if decoding).

  final TextEditingController encryptedTextController = TextEditingController();
  //This controller is used for the TextField that displays the result of the transformation (either the encrypted text if encoding, or the decrypted text if decoding).

  final TextEditingController aController = TextEditingController();
  final TextEditingController bController = TextEditingController();
  //these controllers are for Affine cipher slope A and Intercept B

  String dropDownValue =
      'Choose a Method'; // Define dropDownValue outside of build method
  Color encodeTextColor = Colors.orange;
  Color decodeTextColor = Colors.grey;
  bool isDecodePressed = false;

  void onTapEncode() {
    setState(() {
      encodeTextColor = Colors.orange;
      decodeTextColor = Colors.grey;
      isDecodePressed = false;
    });
  }

  void onTapDecode() {
    setState(() {
      encodeTextColor = Colors.grey;
      decodeTextColor = Colors.orange;
      isDecodePressed = true;
    });
  }

  //Caesar Cipher
  int _shiftValue = 0;
  void _updateShiftValue(double value) {
    setState(() {
      _shiftValue = value.toInt();
    });
  }

  //Rail Fence Cipher
  int _keyValue = 2;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isActive = false;
            });
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // First Container
                    Container(
                      width: screenWidth * 0.25,
                      height: screenHeight * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3),
                          ),
                        ],
                      ),
                      child: TextBox(
                        textType:
                            isDecodePressed ? "Cipher Text:" : "Plain Text:",
                        textHint: "Write something here",
                        textController: pController,
                        readOnly: false,
                      ),
                    ),
                    // Second Container with Dropdown Menu
                    Container(
                      width: screenWidth * 0.25,
                      height: screenHeight * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 70,
                                  height: 100,
                                ),
                                GestureDetector(
                                  onTap: onTapEncode,
                                  child: Text(
                                    'Encode',
                                    style: TextStyle(
                                        color: encodeTextColor,
                                        fontSize: screenWidth * 0.021),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                GestureDetector(
                                  onTap: onTapDecode,
                                  child: Text(
                                    'Decode',
                                    style: TextStyle(
                                        color: decodeTextColor,
                                        fontSize: screenWidth * 0.021),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    12), // Border radius of 12
                                border: Border.all(
                                    color: Colors.grey,
                                    width: 1), // Black border
                              ),
                              child: DropdownButton<String>(
                                value: dropDownValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropDownValue = newValue!;
                                  });
                                },
                                // Customize the dropdown button style
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                                isExpanded: false,
                                dropdownColor: Colors.white,
                                elevation: 8,
                                underline: Container(
                                  height: 2,
                                  color: Colors.transparent,
                                ),
                                items: <String>[
                                  'Choose a Method',
                                  'Vigenere Cipher',
                                  'Caesar Cipher',
                                  'Rail Fence Cipher',
                                  'AtBash Cipher',
                                  'Affine Cipher'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(
                                      width: screenWidth * 0.21,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 16),
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Visibility(
                              visible: dropDownValue == "Rail Fence Cipher",
                              child: Column(
                                children: [
                                  const Text('Pick number of rails'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isActive = true;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: _isActive
                                              ? Colors.orange
                                              : Colors
                                                  .grey, // this translates to if(_isActive = true) => orange else grey
                                        ),
                                      ),
                                      width: screenWidth * 0.225,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: IncrementDecrementFormField<int>(
                                          initialValue: _keyValue,
                                          displayBuilder: (value, field) {
                                            return Text(
                                              value == null
                                                  ? "0"
                                                  : value.toString(),
                                            );
                                          },
                                          onDecrement: (currentValue) {
                                            final newValue = (currentValue! - 1)
                                                .clamp(2, double.infinity)
                                                .toInt();
                                            setState(() {
                                              _isActive = true;
                                              _keyValue = newValue;
                                            });
                                            return _keyValue;
                                          },
                                          onIncrement: (currentValue) {
                                            setState(() {
                                              _isActive = true;
                                              _keyValue =
                                                  (currentValue! + 1).toInt();
                                            });
                                            return _keyValue;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: dropDownValue == "Caesar Cipher",
                              child: Column(
                                children: [
                                  const Text(
                                    "Pick a shift value",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.225,
                                    child: Slider(
                                      value: _shiftValue.toDouble(),
                                      onChanged: _updateShiftValue,
                                      min: 0,
                                      max: 25,
                                      divisions: 25,
                                      label: _shiftValue.toString(),
                                      activeColor: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                            ), //textfield of shift
                            Visibility(
                              visible: dropDownValue == "Vigenere Cipher",
                              child: SizedBox(
                                width: screenWidth * 0.225,
                                child: Theme(
                                  data: ThemeData(
                                    textSelectionTheme: TextSelectionThemeData(
                                      selectionColor: Colors.orange[
                                          200], // Set the color of the selected text
                                    ),
                                  ),
                                  child: TextField(
                                    readOnly: false,
                                    cursorColor: Colors.orange,
                                    decoration: const InputDecoration(
                                      labelText: 'Enter your key here',
                                      labelStyle:
                                          TextStyle(color: Colors.black87),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                    controller: kController,
                                  ),
                                ),
                              ),
                            ), //textfield of key

                            Visibility(
                              visible: dropDownValue == "Affine Cipher",
                              child: SizedBox(
                                width: screenWidth * 0.225,
                                child: Theme(
                                  data: ThemeData(
                                    textSelectionTheme: TextSelectionThemeData(
                                      selectionColor: Colors.orange[
                                      200], // Set the color of the selected text
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      TextField(
                                        readOnly: false,
                                        cursorColor: Colors.orange,
                                        decoration: const InputDecoration(
                                          labelText: 'Enter Slope A here',
                                          labelStyle:
                                          TextStyle(color: Colors.black87),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.orange),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.grey),
                                          ),
                                        ),
                                        controller: aController,
                                      ),
                                      SizedBox(height: 20,),
                                      TextField(
                                        readOnly: false,
                                        cursorColor: Colors.orange,
                                        decoration: const InputDecoration(
                                          labelText: 'Enter Intercept B here',
                                          labelStyle:
                                          TextStyle(color: Colors.black87),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.orange),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.grey),
                                          ),
                                        ),
                                        controller: bController,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ), //textfield of key
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange[400],
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical:
                                            17), // Adjust padding to change button size
                                    minimumSize: const Size(
                                        100, 40), // Set minimum button size
                                  ),
                                  onPressed: () {
                                    if (dropDownValue == "Vigenere Cipher" &&
                                        isDecodePressed == false) {
                                      VigenereCipher vigenereCipher =
                                          VigenereCipher(kController.text);
                                      String encryptedText = vigenereCipher
                                          .encrypt(pController.text);
                                      setState(() {
                                        encryptedTextController.text =
                                            encryptedText;
                                      });
                                    } else if (dropDownValue ==
                                            "Vigenere Cipher" &&
                                        isDecodePressed == true) {
                                      VigenereCipher vigenereCipher =
                                          VigenereCipher(kController.text);
                                      String decryptedText = vigenereCipher
                                          .decrypt(pController.text);
                                      setState(() {
                                        encryptedTextController.text =
                                            decryptedText;
                                      });
                                    } else if (dropDownValue ==
                                            "Caesar Cipher" &&
                                        isDecodePressed == false) {
                                      CaesarCipher cc =
                                          CaesarCipher(_shiftValue.toInt());
                                      String encryptedText =
                                          cc.encrypt(pController.text);
                                      setState(() {
                                        encryptedTextController.text =
                                            encryptedText;
                                      });
                                    } else if (dropDownValue ==
                                            "Caesar Cipher" &&
                                        isDecodePressed == true) {
                                      CaesarCipher cc =
                                          CaesarCipher(_shiftValue.toInt());
                                      String encryptedText =
                                          cc.decrypt(pController.text);
                                      setState(() {
                                        encryptedTextController.text =
                                            encryptedText;
                                      });
                                    } else if (dropDownValue ==
                                            "Rail Fence Cipher" &&
                                        isDecodePressed == false) {
                                      RailFenceCipher rf =
                                          RailFenceCipher(); // No argument needed for the constructor
                                      String encryptedText = rf.encrypt(
                                          pController.text, _keyValue);
                                      setState(() {
                                        encryptedTextController.text =
                                            encryptedText;
                                      });
                                    } else if (dropDownValue ==
                                            "Rail Fence Cipher" &&
                                        isDecodePressed == true) {
                                      RailFenceCipher rf =
                                          RailFenceCipher(); // No argument needed for the constructor
                                      String encryptedText = rf.decrypt(
                                          pController.text, _keyValue);
                                      setState(() {
                                        encryptedTextController.text =
                                            encryptedText;
                                      });
                                    }if (dropDownValue == "AtBash Cipher" && isDecodePressed == true) {
                                      AtbashCipher atbashCipher = AtbashCipher();
                                      String result = atbashCipher.decrypt(pController.text);
                                      setState(() {
                                        encryptedTextController.text = result;
                                      });
                                    } else if (dropDownValue == "AtBash Cipher" && isDecodePressed == false) {
                                      AtbashCipher atbashCipher = AtbashCipher();
                                      String result = atbashCipher.encrypt(pController.text);
                                      setState(() {
                                        encryptedTextController.text = result;
                                      });
                                    }else if (dropDownValue == "Affine Cipher" && isDecodePressed == true) {
                                      AffineCipher affineCipher = AffineCipher();
                                      int intValueA = int.tryParse(aController.text) ?? 0;
                                      int intValueB = int.tryParse(bController.text) ?? 0;
                                      String result = affineCipher.decrypt(pController.text, intValueA, intValueB);
                                      setState(() {
                                        encryptedTextController.text = result;
                                      });
                                    } else if (dropDownValue == "Affine Cipher" && isDecodePressed == false) {
                                      AffineCipher affineCipher = AffineCipher();
                                      int intValueA = int.tryParse(aController.text) ?? 0;
                                      int intValueB = int.tryParse(bController.text) ?? 0;
                                      String result = affineCipher.encrypt(pController.text, intValueA, intValueB);
                                      setState(() {
                                        encryptedTextController.text = result;
                                      });
                                    }


                                  },
                                  child: const Text(
                                    'Convert',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical:
                                            17), // Adjust padding to change button size
                                    minimumSize: const Size(
                                        100, 40), // Set minimum button size
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      kController
                                          .clear(); // Clear text from kController
                                      pController
                                          .clear(); // Clear text from pController
                                      encryptedTextController
                                          .clear(); // Clear text from encryptedTextController
                                      dropDownValue = 'Choose a Method';
                                      encodeTextColor = Colors.orange;
                                      decodeTextColor = Colors.grey;
                                      _keyValue = 2;
                                      _isActive = false;
                                    });
                                  },
                                  child: const Text(
                                    'Reset',
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 100.0,vertical: 10),
                              child: Container(
                                width: 20,
                                height: 50,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Colors.orange, Colors.white],
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if(dropDownValue == "Caesar Cipher") {
                                      // Instantiate the CaesarExplain class
                                      CaesarExplain caesarExplain = CaesarExplain();
                                      // Call the showBottomSheet method to display the bottom sheet
                                      caesarExplain.showBottomSheet(context);
                                    }else
                                    if(dropDownValue == "Vigenere Cipher") {
                                      // Instantiate the CaesarExplain class
                                      VigExplain vExplain = VigExplain();
                                      // Call the showBottomSheet method to display the bottom sheet
                                      vExplain.showBottomSheet(context);
                                    }else
                                    if(dropDownValue == "Rail Fence Cipher") {
                                      // Instantiate the CaesarExplain class
                                      RailExplain rExplain = RailExplain();
                                      // Call the showBottomSheet method to display the bottom sheet
                                      rExplain.showBottomSheet(context);
                                    }
                                    else
                                    if(dropDownValue == "Affine Cipher") {
                                      // Instantiate the CaesarExplain class
                                      AffineExplain aExplain = AffineExplain();
                                      // Call the showBottomSheet method to display the bottom sheet
                                      aExplain.showBottomSheet(context);
                                    }
                                    else
                                    if(dropDownValue == "AtBash Cipher") {
                                      // Instantiate the CaesarExplain class
                                      AtBashExplain abExplain = AtBashExplain();
                                      // Call the showBottomSheet method to display the bottom sheet
                                      abExplain.showBottomSheet(context);
                                    }

                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.orangeAccent), // Transparent background to see the gradient
                                  ),
                                  child: const Text(
                                    "Learn More",
                                    style: TextStyle(
                                      color: Colors.white, // Text color
                                      fontWeight: FontWeight.bold, // Text weight
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Third Container
                    Container(
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextBox(
                          textType:
                              isDecodePressed ? "Plain Text:" : "Cipher Text:",
                          textController: encryptedTextController,
                          showCursor: false,
                          readOnly: true,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
