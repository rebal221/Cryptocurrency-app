import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../responsive_ui.dart';

class CustomTextFieldEmial extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  final FocusNode focusNode;

  const CustomTextFieldEmial({
    Key? key,
    required this.hint,
    required this.textEditingController,
    required this.keyboardType,
    required this.icon,
    required this.obscureText,
    required this.focusNode,
  }) : super(key: key);

  @override
  State<CustomTextFieldEmial> createState() => _CustomTextFieldEmialState();
}

class _CustomTextFieldEmialState extends State<CustomTextFieldEmial> {
  late double _width;

  late double _pixelRatio;

  late bool large;

  late bool medium;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large ? 12 : (medium ? 10 : 8),
      child: TextField(
        onEditingComplete: () {
          widget.focusNode.requestFocus();
          setState(() {});
        },
        autofillHints: [AutofillHints.email],
        autofocus: true,
        textInputAction: TextInputAction.go,
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        cursorColor: Colors.orange[200],
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: Colors.orange[200], size: 20),
          hintText: widget.hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

class CustomTextFieldPassword extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  final FocusNode focusNode;
  const CustomTextFieldPassword({
    Key? key,
    required this.hint,
    required this.textEditingController,
    required this.keyboardType,
    required this.icon,
    required this.obscureText,
    required this.focusNode,
  }) : super(key: key);

  @override
  State<CustomTextFieldPassword> createState() =>
      _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  late double _width;

  late double _pixelRatio;

  late bool large;

  late bool medium;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large ? 12 : (medium ? 10 : 8),
      child: TextFormField(
        onEditingComplete: () {
          widget.focusNode.requestFocus();
          setState(() {});
        },
        autofillHints: [AutofillHints.password],
        autofocus: true,
        textInputAction: TextInputAction.go,
        onFieldSubmitted: (Value) {},
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        cursorColor: Colors.orange[200],
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: Colors.orange[200], size: 20),
          hintText: widget.hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

class CustomTextFieldName extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  final FocusNode focusNode;
  const CustomTextFieldName({
    Key? key,
    required this.hint,
    required this.textEditingController,
    required this.keyboardType,
    required this.icon,
    required this.obscureText,
    required this.focusNode,
  }) : super(key: key);

  @override
  State<CustomTextFieldName> createState() => _CustomTextFieldNameState();
}

class _CustomTextFieldNameState extends State<CustomTextFieldName> {
  late double _width;

  late double _pixelRatio;

  late bool large;

  late bool medium;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large ? 12 : (medium ? 10 : 8),
      child: TextFormField(
        onEditingComplete: () {
          widget.focusNode.requestFocus();
          setState(() {});
        },
        autofillHints: [AutofillHints.password],
        autofocus: true,
        textInputAction: TextInputAction.go,
        onFieldSubmitted: (Value) {},
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        cursorColor: Colors.orange[200],
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: Colors.orange[200], size: 20),
          hintText: widget.hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

class CustomTextFieldPhone extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  final FocusNode focusNode;
  const CustomTextFieldPhone({
    Key? key,
    required this.hint,
    required this.textEditingController,
    required this.keyboardType,
    required this.icon,
    required this.obscureText,
    required this.focusNode,
  }) : super(key: key);

  @override
  State<CustomTextFieldPhone> createState() => _CustomTextFieldPhoneState();
}

class _CustomTextFieldPhoneState extends State<CustomTextFieldPhone> {
  late double _width;

  late double _pixelRatio;

  late bool large;

  late bool medium;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large ? 12 : (medium ? 10 : 8),
      child: TextFormField(
        onEditingComplete: () {
          widget.focusNode.requestFocus();
          setState(() {});
        },
        autofillHints: [AutofillHints.password],
        autofocus: true,
        textInputAction: TextInputAction.go,
        onFieldSubmitted: (Value) {},
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        cursorColor: Colors.orange[200],
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: Colors.orange[200], size: 20),
          hintText: widget.hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
