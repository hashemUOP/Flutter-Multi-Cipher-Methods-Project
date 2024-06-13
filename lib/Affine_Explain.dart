import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nis/url.dart';

class AffineExplain {
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
                                  \nSure! Here's a simple explanation of how to encode \na message using the affine cipher in a\n few easy steps:\n

\n1. **Understand the Affine Cipher**: \nThe affine cipher is a type of monoalphabetic substitution cipher,\n which means it substitutes one letter for another.\n It uses a mathematical function to encode the message.\n

\n2. **Choose Parameters**:\n You need to choose two numbers, \nusually called 'a' and 'b', \nwhere 'a' must be chosen such that it is coprime with \nthe length of the alphabet (26 in English). \n'b' can be any integer.\n

\n3. **Convert Letters to Numbers**:\n Assign a number to each letter of the alphabet.\n For example, in English, 'A' could be 0,\n 'B' could be 1, and so on, up to 'Z' being 25.\n

\n4. **Apply the Encoding Formula**:\n The encoding formula is:\n ( E(x) = (ax + b) mod 26 ),\n where ( x ) is the numerical value of the letter,\n and ( E(x) \) is the encoded value.\n

\n5. **Encode the Message**:\n Apply the formula to each letter of your message.\n

\n6. **Convert Back to Letters**:\n Convert the encoded numbers back to letters \nusing the same numbering system you used in step 3.\n

\nLet's do an example:\n

\nSuppose we choose \( a = 5 \) and \( b = 8 \),\n and we want to encode the message "HELLO".\n

\n1. Convert letters to numbers:\n  
  \n H -> 7\n  
   \nE -> 4 \n 
   \nL -> 11\n  
   \nL -> 11\n  
   \nO -> 14\n

\n2. Apply the encoding\n formula for each letter:\n

   \n- For H: ( E(7) = (5 times 7 + 8) mod 26\n = (35 + 8) mod 26 = 43 mod 26 = 17 )\n
     \nSo, H is encoded as the 17th \nletter of the alphabet, which is R.\n
   
   \n- For E: ( E(4) = (5 times 4 + 8) mod 26 \n= (20 + 8) mod 26 = 28 mod 26 = 2 )\n  
     \nSo, E is encoded as the 2nd letter\n of the alphabet, which is C.\n
   
   \n- For L: ( E(11) = (5 times 11 + 8) mod 26 \n = (55 + 8) \mod 26 = 63 \mod 26 = 11)\n  
     \nSo, L is encoded as the 11th letter of the\n alphabet, which is L (no change).\n
   
   \n- For L: ( E(11) = (5 times 11 + 8) mod 26\n = (55 + 8) mod 26 = 63 mod 26 = 11 )\n  
     \nSo, L is encoded as the 11th letter of \nthe alphabet, which is L (no change).\n
   
   \n- For O: ( E(14) = (5)times (14 + 8) mod 26 \n = (70 + 8) mod 26 = 78 mod 26 = 0 )\n  
     \nSo, O is encoded as the 0th letter\n of the alphabet, which is A.\n

\nSo, "HELLO" is encoded as "RCLLA"\n.

                                  ''',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                SizedBox(height:10,),
                                Text("In case you still didn't get the info, checkout video." ,style: TextStyle(color: Colors.deepOrange),),
                                SizedBox(height:10,),
                                Padding(
                                  padding: EdgeInsets.only(left: 200.0 , top: 15),
                                  child: MyHomePage(urlPath: "https://www.youtube.com/watch?v=bnsGxuoAOZs",),
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
                                      
                                  ''',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                SizedBox(height:20,),
                                Text("In case you still didn't get the info, checkout video." , style: TextStyle(color: Colors.deepOrangeAccent),),
                                SizedBox(height:10,),
                                Padding(
                                  padding: EdgeInsets.only(left: 200,top:8.0),
                                  child: MyHomePage(urlPath: "https://www.youtube.com/watch?v=bnsGxuoAOZs",),
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
