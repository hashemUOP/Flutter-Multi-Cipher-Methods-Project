import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nis/url.dart';

class AtBashExplain {
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
                                  \nAtBash Cipher Encryption and Decryption Steps\n
\nStep 1: Create the AtBash Alphabet\n
\nWrite the alphabet in normal order:\n

\n
Copy code
\n
ABCDEFGHIJKLMNOPQRSTUVWXYZ
\n
Write the alphabet in reverse order below it:

\n
Copy code
\n
ZYXWVUTSRQPONMLKJIHGFEDCBA
\n

Step 2: Encryption
\nFor each letter in your plaintext message,\n find the corresponding letter in the reversed alphabet.\n

\n
Example:
\n
Plaintext: HELLO
\n
H -> S, E -> V, L -> O, L -> O, O -> L
\n
Encrypted: SVOOL
\n
Non-alphabet characters remain unchanged.
\n
                                  ''',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                                SizedBox(height:10,),
                                Text("In case you still didn't get the info, checkout video." ,style: TextStyle(color: Colors.deepOrange),),
                                SizedBox(height:10,),
                                Padding(
                                  padding: EdgeInsets.only(left: 200.0 , top: 15),
                                  child: MyHomePage(urlPath: "https://www.youtube.com/watch?v=WYvHY7Kv3QU",),
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
                                      \nStep 3: Decryption\n
\nFor each letter in your ciphertext message,\n find the corresponding letter in the normal\n alphabet using the reversed alphabet.\n

\n
Example:
\n
Ciphertext: SVOOL
\n
S -> H, V -> E, O -> L, O -> L, L -> O
\n
Decrypted: HELLO
\n
Non-alphabet characters remain unchanged.
\n
                                  ''',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                                SizedBox(height:20,),
                                Text("In case you still didn't get the info, checkout video." , style: TextStyle(color: Colors.deepOrangeAccent),),
                                SizedBox(height:10,),
                                Padding(
                                  padding: EdgeInsets.only(left: 200,top:8.0),
                                  child: MyHomePage(urlPath: "https://www.youtube.com/watch?v=WYvHY7Kv3QU",),
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
