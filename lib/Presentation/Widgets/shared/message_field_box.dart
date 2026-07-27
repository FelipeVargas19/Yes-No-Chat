import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder= UnderlineInputBorder(
      borderSide:  const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20)
    );

    final inputDecoration = InputDecoration(
        hintText: 'PAPIPONELOAKI',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton( 
          icon: const Icon(Icons.send_outlined),
          onPressed: (){
            final textValue=textController.value.text;
            print('boton: $textValue');
            textController.clear();
          }, 
        ),
      );


    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Obteneradsasd');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}