import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key key,
    @required this.borderText,
    @required this.bodyText,
  }) : super(key: key);
  final String borderText;
  final String bodyText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: TextField(
        autofocus: true,
        enabled: false,
        enableInteractiveSelection: false,
        focusNode: FocusNode(),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          labelText: borderText,
          labelStyle: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.grey.shade600),
          hintText: bodyText,
          hintStyle: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
