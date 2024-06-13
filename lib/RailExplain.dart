import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nis/url.dart';

class RailExplain {
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
                                      \nEncoding a Rail Fence Cipher:\n

                                      \nEncoding a message using the Rail Fence cipher involves writing the\n plaintext message in a zigzag pattern across a number of "rails" or lines,\n then reading off the letters row by row to create the ciphertext.\n Here are the steps:\n

                                      \n1. **Choose the Number of Rails**:\n Determine the number of rails or lines to use\n for encoding. This is typically a positive integer.\n

                                      \n2. **Write the Plaintext in a Zigzag Pattern**:\n Write the letters of the plaintext message in a\n zigzag pattern across the determined number of rails.\n Start by writing the first letter at the top left corner,\n then continue writing diagonally downwards until reaching the bottom rail, \nthen diagonally upwards until reaching the top rail,\n and so on until all letters are written.\n

                                      \n3. **Read Off the Letters Row by Row**: \nOnce the plaintext message is written in the zigzag pattern,\n read off the letters row by row,\n starting from the top left corner and continuing to the bottom right corner.\n

                                      \n4. **Concatenate the Rows to Form the Ciphertext**:\n Concatenate the letters read off from each row to form the ciphertext.\n

                                  \n# Example:\n

                                      \nLet's encode the plaintext "HELLO" using a Rail Fence cipher with 3 rails:\n

                                      \n1. **Choose the Number of Rails**: lets say 3\n

                                      \n2. **Write the Plaintext in a Zigzag Pattern**:\n
                                      \nH . . . O . . .\n
                                      \n. E . L . L . .\n
                                      \n. . L . . . . .\n

                                      \n3. **Read Off the Letters Row by Row**:\n

                                      \nStarting from the top left corner, read the letters row by row:\n
                                      \nHO . O . . . . (1st row)\n
                                      \n.E . L . L . . (2nd row)\n
                                      \n.. . . . . . . (3rd row)\n

                                      \n4. **Concatenate the Rows to Form the Ciphertext**:\n

                                       \nConcatenate the letters read off from each\n row to form the ciphertext:\n

                                       \nHOOELL\n

                                       \nSo, the ciphertext for the plaintext "HELLO" using a\n Rail Fence cipher with 3 rails is "HOOELL".\n


                                  ''',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                SizedBox(height:10,),
                                Text("In case you still didn't get the info, checkout video." ,style: TextStyle(color: Colors.deepOrange),),
                                SizedBox(height:10,),
                                Padding(
                                  padding: EdgeInsets.only(left: 200.0 , top: 15),
                                  child: MyHomePage(urlPath: "https://www.youtube.com/watch?v=wKjRwJTXQH4",),
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
                                      \n# Decoding a Rail Fence Cipher:\n
  
                                        \nDecoding a message encrypted with the Rail Fence cipher\n involves reconstructing the original plaintext from the \nciphertext by reversing the encoding process. Here are the steps:\n
  
                                        \n1. **Choose the Number of Rails**: \nDetermine the number of rails or lines\n used for encoding the ciphertext.\n
  
                                        \n2. **Calculate the Rail Length**:\n For a given ciphertext length and number of rails,\n calculate the length of each rail. \nThis helps in determining how many letters are in each row.\n
  
                                        \n3. **Create Empty Rails**: \nCreate an empty grid with the same dimensions\n as the original encoding grid,\n filled with placeholders (e.g., dots or spaces).\n
  
                                        \n4. **Fill the Grid**: Place each letter of the ciphertext in the grid\n following the zigzag pattern,\n similar to the encoding process. \nThis helps in visualizing the original order of the letters.\n
  
                                        \n5. **Read Off the Letters Row by Row**:\n Once the grid is filled,\n read off the letters row by row,\n starting from the top left corner \nand continuing to the bottom right corner.\n
  
                                        \n6. **Reconstruct the Plaintext**:\n Concatenate the letters read off from each row\n to form the reconstructed plaintext.\n
  
                                        \n# Example:\n
  
                                        \nLet's decode the ciphertext "HOOELL"\n using a Rail Fence cipher with 3 rails:\n
  
                                        \n1. **Choose the Number of Rails**: 3\n
  
                                        \n2. **Calculate the Rail Length**:\n For 6 letters and 3 rails,\n each rail will have 2 letters.\n
  
                                        \n3. **Create Empty Rails**:\n
  
                                          \n. . . . . .\n
                                          \n. . . . . .\n
                                          \n. . . . . .\n
  

  
                                        \n4. **Fill the Grid**:\n
  
                                          \nH . . . O . . .\n
                                          \n. . . . . . . .\n
                                          \n. . . . . . . .\n
  
                                       \n5. **Read Off the Letters Row by Row**:\n
  
                                          \nStarting from the top left corner, read the letters row by row:\n
  
                                          \nH . . . O . . . (1st row)\n
                                          \n. . . . . . . . (2nd row)\n
                                          \n. . . . . . . . (3rd row)\n
  

                                        \n6. **Reconstruct the Plaintext**: "HELLO"\n
  
                                        \nSo, the plaintext for the ciphertext "HOOELL" \nusing a Rail Fence cipher with 3 rails is "HELLO".\n
  
                                    ''',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                SizedBox(height:20,),
                                Text("In case you still didn't get the info, checkout video." , style: TextStyle(color: Colors.deepOrangeAccent),),
                                SizedBox(height:10,),
                                Padding(
                                  padding: EdgeInsets.only(left: 200,top:8.0),
                                  child: MyHomePage(urlPath: "https://www.youtube.com/watch?v=LEGPQ59bGZo",),
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
