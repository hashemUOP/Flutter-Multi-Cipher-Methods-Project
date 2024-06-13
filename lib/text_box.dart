import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final TextEditingController? textController;
  final String textType;
  final String? textHint;
  final bool? readOnly;
  final bool? showCursor;

  // Constructor with required parameter 'textType'
  TextBox({Key? key, required this.textType, this.textHint, this.textController , this.readOnly = false,this.showCursor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
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
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 190.0, top: 20),
            child: Text(
              textType,
              style: const TextStyle(
                color: Colors.orange,
                fontSize: 28,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: screenWidth * 0.22,
              height: screenHeight * 0.4,
              child: Theme(
                data: ThemeData(
                  textSelectionTheme: TextSelectionThemeData(
                    selectionColor: Colors.orange[200], // Set the color of the selected text
                  ),
                ),
                child: TextField(
                  readOnly: readOnly!,
                  showCursor: showCursor,
                  textAlignVertical: TextAlignVertical.top,
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: textHint,
                    contentPadding: const EdgeInsets.all(20), // Adjust content padding
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  expands: true,
                  maxLines: null,
                  cursorColor: Colors.orange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
