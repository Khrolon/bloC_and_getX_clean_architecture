// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomTextField extends StatefulWidget {
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

  const CustomTextField({
    Key? key,
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
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  RxBool showPassword = false.obs;
  RxBool wrapperToReactive = true.obs;

  void togglevisibility() {
    showPassword.value = !showPassword.value;
  }

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
                ),
                child: TextField(
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
                  obscureText: widget.obscureText && !showPassword.isTrue,
                  decoration: InputDecoration(
                    errorText: widget.errorText,
                    floatingLabelBehavior: widget.floatingLabelBehavior,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(231, 234, 241, 1),
                        width: 1,
                      ),
                    ),
                    alignLabelWithHint: true,
                    labelText: widget.labelText,
                    labelStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: widget.labelTextFontSize,
                      color: widget.labelColorText,
                    ),
                    suffixIcon: widget.obscureText
                        ? GestureDetector(
                            onTap: () {
                              togglevisibility();
                            },
                            child: Icon(
                              showPassword.isFalse
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black26,
                            ),
                          )
                        : null,
                  ),
                ),
              )
            : Container(),
      ),
    );
  }
}
