import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nis/url.dart';

class CaesarExplain {
  bool isEncrypt = true;
  Color encodeTextColor = Colors.black;

  void _onTapEncode(StateSetter setState) {
    setState(() {
      isEncrypt = true;
      encodeTextColor = Colors.orange;
    });
  }

  void _onTapDecode(StateSetter setState) {
    setState(() {
      isEncrypt = false;
      encodeTextColor = Colors.black;
    });
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Dialog(
              backgroundColor: Colors.orange[100],
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Learn More',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          ),
                          GestureDetector(
                            onTap: () => _onTapEncode(setState),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Encryption',
                                style: TextStyle(
                                  fontSize: 15,
                                  color:
                                      isEncrypt ? Colors.orange : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _onTapDecode(setState),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Decryption',
                                style: TextStyle(
                                  fontSize: 15,
                                  color:
                                      !isEncrypt ? Colors.orange : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: isEncrypt,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  'Steps to Encode Using Caesar Cipher \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '1. Choose a Shift Key: \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- Decide on a shift value (key). \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  'For example, let\'s use a shift key of 3. \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '2. Write Down the Alphabet:- \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  'A B C D E F G H I J K L M N O P Q R S T U V W X Y Z. \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '3. Shift the Alphabet: \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- Create a new shifted alphabet by moving each letter 3 positions to the right: \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- Original: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  ' - Shifted:  D E F G H I J K L M N O P Q R S T U V W X Y Z A B C \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '4. Map Each Letter: \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- Create a mapping from each original letter to its shifted counterpart: \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- A -> D, B -> E, C -> F, ..., X -> A, Y -> B, Z -> C. \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '5. Encode Your Message: \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- Replace each letter in your original message with \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  'its corresponding shifted letter using the mapping. \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- Example: To encode "HELLO" with a shift of 3: \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- E -> H \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- L -> O \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- L -> O \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- O -> R \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- Encoded message: "KHOOR". \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  'Example in Detail \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  'Lets encode the word ATTACK with a shift of 3. \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '1. Original Alphabet: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '2. Shifted Alphabet:  D E F G H I J K L M N O P Q R S T U V W X Y Z A B C \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  ' 3. Mapping: \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- A -> D \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- T -> W \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- T -> W \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- A -> D \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- C -> F \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- K -> N \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '4. Encoded Message: "DWWDFN" \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  ' That is it! You have successfully encoded a message using the Caesar cipher.\n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                SizedBox(height:10,),
                                Text("In case you still didn't get the info, checkout video." ,style: TextStyle(color: Colors.deepOrange),),
                                SizedBox(height:10,),
                                Padding(
                                  padding: EdgeInsets.only(left: 200.0 , top: 15),
                                  child: MyHomePage(urlPath: "https://www.youtube.com/watch?v=fR8rVR72a6o",),
                                )
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: !isEncrypt,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  'Steps to Decode Using Caesar Cipher: \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '1. Choose a Shift Key: \n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- Determine the shift value used for encoding the message.\n This is often provided or known beforehand.\n If not, you may need to try different shift values until\n the decoded message makes sense.\n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '2. Write Down the Alphabet:\n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '- Write down the alphabet in a straight line.\n You\'ll use this to revert the shifts applied during encoding.\n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '3.Reverse the Shift: For each letter in the ciphertext, \n find its corresponding letter by shifting it\n backward by the key number in the alphabet.\n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  'If the shift key is 3, then A would decode to X, B to Y, C to Z, and so on.\n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '4.Replace Each Letter: Replace each letter in the ciphertext with its \ncorresponding letter from the previous step.\n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '5.Reconstruct the Plaintext: Combine the decoded\n letters to form the plaintext message.\n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  'Example Ciphertext: "DOLPHIN"\nShift Key: 3\nSteps to Decode:\n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AutoSizeText(
                                  '1.Write Down the Alphabet: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z\n2.Shift Each Letter Backward by 3:\nD -> A\nO -> L\nL -> I\nP -> M\nH -> E\nI -> F\nN -> K\n',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                AutoSizeText(
                                  'Replace Each Letter:\nD becomes A\nO becomes L\nL becomes I\nP becomes M\nH becomes E\nI becomes F\nN becomes K\nReconstruct the Plaintext:\n "DOLPHIN" decodes to "ALIMEFK" with a shift key of 3.\nIn reality,\n the decoded message "ALIMEFK"\n may not make sense unless\n the shift key correctly matches the encoding key.\n Ensure to use the correct key to get meaningful plaintext.\n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                SizedBox(height:20,),
                                Text("In case you still didn't get the info, checkout video.\n" , style: TextStyle(color: Colors.deepOrangeAccent),),
                                SizedBox(height:10,),
                                Padding(
                                  padding: EdgeInsets.only(left: 200,top:8.0),
                                  child: MyHomePage(urlPath: "https://www.youtube.com/watch?v=fR8rVR72a6o",),
                                )
                                // Add more lines as needed
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: const Text(
                            'Close',
                            style:
                                TextStyle(fontSize: 15, color: Colors.orange),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
