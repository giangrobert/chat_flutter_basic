import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onSubmitted;
  const MessageFieldBox({super.key, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    final textcontroller = TextEditingController();

    final focusNode = FocusNode();

    final colors = Theme.of(context).colorScheme;

    final outlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: colors.primary),
    );

    final inputDecoration = InputDecoration(
      filled: true,
      hintText: 'eND YOUR MEME ?',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.send_outlined),
            onPressed: () {
              final textValue = textcontroller.value.text;
              onSubmitted(textValue);            
              textcontroller.clear();
            },
          ),
        ],
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      controller: textcontroller,
      focusNode: focusNode,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textcontroller.clear();
        focusNode.requestFocus();
        onSubmitted(value);
      },
    );
  }
}
