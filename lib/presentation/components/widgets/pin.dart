import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_app/utils/styles.dart';

const int millisecondsDelay = 300;

class Pin extends StatefulWidget {
  final void Function(String)? onChanged;

  Pin({
    this.onChanged,
  });

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _PinItem(
            focusNode: firstFieldFocusNode,
            autoFocus: true,
            onChanged: (String value) {
              if (value.isEmpty) {
                pin = '';
                if (widget.onChanged != null) {
                  widget.onChanged!(pin);
                }
              }
              if (value.isNotEmpty && value.length == 1) {
                pin = pin + value;
                if (widget.onChanged != null) {
                  widget.onChanged!(pin);
                }
                Future.delayed(Duration(milliseconds: millisecondsDelay)).then((value) => secondFieldFocusNode?.requestFocus());
              }
            }),
        _PinItem(
            focusNode: secondFieldFocusNode,
            autoFocus: false,
            onChanged: (String value) {
              if (value.isEmpty) {
                pin = pin.substring(0);
                firstFieldFocusNode?.requestFocus();
                if (widget.onChanged != null) {
                  widget.onChanged!(pin);
                }
              }
              if (value.isNotEmpty && value.length == 1) {
                pin = pin + value;
                if (widget.onChanged != null) {
                  widget.onChanged!(pin);
                }
                Future.delayed(Duration(milliseconds: millisecondsDelay)).then((value) => thirdFieldFocusNode?.requestFocus());
              }
            }),
        _PinItem(
            focusNode: thirdFieldFocusNode,
            autoFocus: false,
            onChanged: (String value) {
              if (value.isEmpty) {
                pin = pin.substring(0, 1);
                secondFieldFocusNode?.requestFocus();
                if (widget.onChanged != null) {
                  widget.onChanged!(pin);
                }
              }
              if (value.isNotEmpty && value.length == 1) {
                pin = pin + value;
                if (widget.onChanged != null) {
                  widget.onChanged!(pin);
                }
                Future.delayed(Duration(milliseconds: millisecondsDelay)).then((value) => fourthFieldFocusNode?.requestFocus());
              }
            }),
        _PinItem(
            focusNode: fourthFieldFocusNode,
            autoFocus: false,
            onChanged: (String value) {
              if (value.isEmpty) {
                pin = pin.substring(0, 2);
                thirdFieldFocusNode?.requestFocus();
                if (widget.onChanged != null) {
                  widget.onChanged!(pin);
                }
              }
              if (value.isNotEmpty && value.length == 1) {
                pin = pin + value;
                if (widget.onChanged != null) {
                  widget.onChanged!(pin);
                }
                Future.delayed(Duration(milliseconds: millisecondsDelay)).then((value) => FocusScope.of(context).requestFocus(FocusNode()));
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

  const _PinItem({
    Key? key,
    required this.focusNode,
    required this.onChanged,
    required this.autoFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0,
      width: 64.0,
      margin: EdgeInsets.all(8.0),
      child: CupertinoTextField(
        padding: EdgeInsets.only(top: 10),
        autofocus: autoFocus,
        focusNode: focusNode,
        onChanged: onChanged,
        maxLength: 1,
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
        style: primaryTextBold28,
        keyboardType: TextInputType.number,
        decoration: BoxDecoration(
            color: NXColors.inputFieldFillColor,
            border: Border.all(color: NXColors.fillDarkPrimary.withOpacity(1), width: 2),
            borderRadius: BorderRadius.circular(
              Constants.pinWidgetBorderRadius,
            )),
      ),
    );
  }
}
