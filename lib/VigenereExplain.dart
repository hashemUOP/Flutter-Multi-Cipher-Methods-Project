import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nis/url.dart';

class VigExplain {
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
                                  ''' 
                                  \n1.Steps to Encode a Vigenère Cipher\n
                                  \n2.Choose a Keyword: Select a keyword that will be \nused to shift the letters in the plaintext.\n

                                  \n3.Repeat the Keyword: Repeat or extend the keyword so that it \nmatches the length of the plaintext.\n

                                  \n4.Align the Plaintext with the Keyword:\n Write the plaintext and the extended keyword beneath it.\n

                                  \n5.Encode Each Letter:\n For each letter in the plaintext:\n

                                  \n6.Find the corresponding letter in the keyword.\n
                                  \nUse the Vigenère table (or simply shift the plaintext letter by the \nposition of the keyword letter in the alphabet).\n
                                  \nExample:\n
                                  \nPlaintext: "HELLO"\n
                                  \nKeyword: "KEY"\n
                                  \nSteps to Encode:\n

                                  \nChoose a Keyword: "KEY"\n

                                  \nRepeat the Keyword: Extend "KEY" to match "HELLO":\n

                                  \nKeyword: "KEYKE"\n
                                  \nAlign the Plaintext with the Keyword:\n

                                  \nPlaintext: H E L L O\n
                                  \nKeyword:   K E Y K E\n
                                  \nEncode Each Letter:\n

                                  \nH shifted by K (K is the 11th letter):\n (H -> 7, K -> 10) => (7 + 10) % 26 = 17 -> R\n
                                  \nE shifted by E (E is the 5th letter):\n (E -> 4, E -> 4) => (4 + 4) % 26 = 8 -> I\n
                                 \nL shifted by Y (Y is the 25th letter):\n (L -> 11, Y -> 24) => (11 + 24) % 26 = 9 -> J\n
                                  \nL shifted by K (K is the 11th letter): \n(L -> 11, K -> 10) => (11 + 10) % 26 = 21 -> V\n
                                  \nO shifted by E (E is the 5th letter):\n (O -> 14, E -> 4) => (14 + 4) % 26 = 18 -> S\n
                                  \nConstruct the Ciphertext: "RIJVS"\n

                                  \nSo, "HELLO" encoded with the keyword "KEY" becomes "RIJVS".\n
                                  ''',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                SizedBox(height:10,),
                                Text("In case you still didn't get the info, checkout video." ,style: TextStyle(color: Colors.deepOrange),),
                                SizedBox(height:10,),
                                Padding(
                                  padding: EdgeInsets.only(left: 200.0 , top: 15),
                                  child: MyHomePage(urlPath: "https://www.youtube.com/watch?v=SkJcmCaHqS0",),
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
                                  '''
                                      \n-Decoding a Vigenère Cipher\n
                                      \n*Steps to Decode:\n

                                      \n1. Repeat the Keyword**: Extend "KEY" to match "RIJVS":\n
                                          \n- Keyword: "KEYKE"\n

                                      \n2. Align the Ciphertext with the Keyword:\n

                                      \n3 .Decode Each Letter:\n
                                        \n- R shifted by K (K is the 11th letter):\n (R -> 17, K -> 10) => (17 - 10) % 26 = 7 -> H\n
                                        \n- I shifted by E (E is the 5th letter):\n (I -> 8, E -> 4) => (8 - 4) % 26 = 4 -> E\n
                                        \n- J shifted by Y (Y is the 25th letter):\n (J -> 9, Y -> 24) => (9 - 24) % 26 = 11 -> L\n
                                        \n- V shifted by K (K is the 11th letter):\n (V -> 21, K -> 10) => (21 - 10) % 26 = 11 -> L\n
                                        \n- S shifted by E (E is the 5th letter):\n (S -> 18, E -> 4) => (18 - 4) % 26 = 14 -> O\n

                                      \n4. Construct the Plaintext: "HELLO"\n

                                  ''',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                SizedBox(height:20,),
                                Text("In case you still didn't get the info, checkout video." , style: TextStyle(color: Colors.deepOrangeAccent),),
                                SizedBox(height:10,),
                                Padding(
                                  padding: EdgeInsets.only(left: 200,top:8.0),
                                  child: MyHomePage(urlPath: "https://www.youtube.com/watch?v=oHcJ4QLiiP8",),
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
