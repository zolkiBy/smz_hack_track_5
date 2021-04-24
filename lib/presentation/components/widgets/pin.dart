import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_app/utils/styles.dart';

class Pin extends StatefulWidget {
  @override
  _PinState createState() => _PinState();
}

class _PinState extends State<Pin> {
  FocusNode? firstFieldFocusNode;
  FocusNode? secondFieldFocusNode;
  FocusNode? thirdFieldFocusNode;
  FocusNode? fourthFieldFocusNode;

  String pin = '';

  @override
  void initState() {
    super.initState();

    firstFieldFocusNode = FocusNode();
    secondFieldFocusNode = FocusNode();
    thirdFieldFocusNode = FocusNode();
    fourthFieldFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _PinItem(
            focusNode: firstFieldFocusNode,
            autoFocus: true,
            onChanged: (String value) {
              if (value.isNotEmpty && value.length == 1) {
                pin = pin + value;
                Future.delayed(const Duration(milliseconds: 500), () {
                  secondFieldFocusNode?.requestFocus();
                });
              }
            }),
        _PinItem(
            focusNode: secondFieldFocusNode,
            autoFocus: false,
            onChanged: (String value) {
              if (value.isNotEmpty && value.length == 1) {
                pin = pin + value;
                Future.delayed(const Duration(milliseconds: 500), () {
                  thirdFieldFocusNode?.requestFocus();
                });
              }
            }),
        _PinItem(
            focusNode: thirdFieldFocusNode,
            autoFocus: false,
            onChanged: (String value) {
              if (value.isNotEmpty && value.length == 1) {
                pin = pin + value;
                Future.delayed(const Duration(milliseconds: 500), () {
                  fourthFieldFocusNode?.requestFocus();
                });
              }
            }),
        _PinItem(
            focusNode: fourthFieldFocusNode,
            autoFocus: false,
            onChanged: (String value) {
              if (value.isNotEmpty && value.length == 1) {
                pin = pin + value;
                Future.delayed(const Duration(milliseconds: 500), () {
                  FocusScope.of(context).requestFocus(FocusNode());
                });
              }
            }),
      ],
    );
  }

  @override
  void dispose() {
    firstFieldFocusNode?.dispose();
    secondFieldFocusNode?.dispose();
    thirdFieldFocusNode?.dispose();
    fourthFieldFocusNode?.dispose();

    super.dispose();
  }
}

class _PinItem extends StatelessWidget {
  final FocusNode? focusNode;
  final ValueChanged<String> onChanged;
  final bool autoFocus;

  const _PinItem({Key? key, required this.focusNode, required this.onChanged, required this.autoFocus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0,
      width: 64.0,
      margin: EdgeInsets.all(8.0),
      child: TextFormField(
        autofocus: autoFocus,
        focusNode: focusNode,
        onChanged: onChanged,
        showCursor: false,
        enableSuggestions: false,
        enableInteractiveSelection: false,
        textAlign: TextAlign.center,
        toolbarOptions: ToolbarOptions(
          cut: false,
          copy: false,
          paste: false,
          selectAll: false,
        ),
        obscureText: true,
        style: primaryText28,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: true,
          fillColor: NXColors.inputFieldFillColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(Constants.pinWidgetBorderRadius)),
        ),
      ),
    );
  }
}
