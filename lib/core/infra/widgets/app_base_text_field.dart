// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomTextField extends StatefulWidget {
  final FocusNode? textFocusNode;
  final String? labelText;
  final Color labelColorText;
  final double labelTextFontSize;
  final Color backgroundColor;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool autofocus;
  final bool forceUpperCase;
  final bool enabled;
  final bool expanded;
  final int? maxLines;
  final TextAlignVertical textAlignVertical;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final void Function(String)? onChanged;
  final String? errorText;
  final InputBorder? inputBorderDecoration;
  final InputBorder? inputEnableBorderDecoration;
  final Widget? prefixWidget;
  final Widget? suffixIconWidget;
  final bool showPassword;

  const CustomTextField({
    Key? key,
    this.textFocusNode,
    this.labelText,
    this.labelColorText = const Color(0xff9D9DB6),
    this.labelTextFontSize = 12,
    this.obscureText = false,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.autofocus = false,
    this.forceUpperCase = false,
    this.enabled = true,
    this.expanded = false,
    this.maxLines = 1,
    this.textAlignVertical = TextAlignVertical.center,
    this.onChanged,
    this.backgroundColor = Colors.transparent,
    this.floatingLabelBehavior,
    this.errorText,
    this.inputBorderDecoration = const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    this.inputEnableBorderDecoration = const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: Color.fromRGBO(231, 234, 241, 1),
        width: 1,
      ),
    ),
    this.prefixWidget,
    this.suffixIconWidget,
    this.showPassword = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  RxBool wrapperToReactive = true.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Obx(
        () => wrapperToReactive.isTrue
            ? Container(
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  // border: BoxBorder.all()
                ),
                child: TextField(
                  focusNode: widget.textFocusNode,
                  textAlignVertical: widget.textAlignVertical,
                  onChanged: widget.onChanged ?? (e) {},
                  maxLines: widget.maxLines,
                  expands: widget.expanded,
                  enabled: widget.enabled,
                  textCapitalization: widget.forceUpperCase
                      ? TextCapitalization.sentences
                      : TextCapitalization.none,
                  autofocus: widget.autofocus,
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  obscureText: widget.obscureText && !widget.showPassword,
                  decoration: InputDecoration(
                    prefixIcon: widget.prefixWidget,
                    errorText: widget.errorText,
                    floatingLabelBehavior: widget.floatingLabelBehavior,
                    border: widget.inputBorderDecoration,
                    enabledBorder: widget.inputEnableBorderDecoration,
                    disabledBorder: widget.inputEnableBorderDecoration,
                    alignLabelWithHint: true,
                    labelText: widget.labelText,
                    labelStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: widget.labelTextFontSize,
                      color: widget.labelColorText,
                    ),
                    suffixIcon: widget.suffixIconWidget,
                  ),
                ),
              )
            : Container(),
      ),
    );
  }
}
