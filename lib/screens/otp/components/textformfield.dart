import 'package:flutter/material.dart';

import '../../../responsive_ui.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;

  const CustomTextField({
    Key? key,
    required this.hint,
    required this.textEditingController,
    required this.keyboardType,
    required this.icon,
    required this.obscureText,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        cursorColor: Colors.orange[200],
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
