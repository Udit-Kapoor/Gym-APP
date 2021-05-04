import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    Key key,
    @required this.borderText,
    @required this.bodyText,
    this.padding,
    this.labelStyle,
  }) : super(key: key);
  final TextStyle labelStyle;
  final String borderText;
  final String bodyText;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: TextField(
        autofocus: true,
        enabled: false,
        enableInteractiveSelection: false,
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
              .copyWith(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }
}
