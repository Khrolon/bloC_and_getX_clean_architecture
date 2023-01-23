import 'package:flutter/material.dart';

enum AppButtonStyle {
  text,
  outlined,
  contained,
}

class AppButtonWidget extends StatelessWidget {
  final AppButtonStyle style;
  final Widget? child;
  final void Function()? onPressed;
  final bool disableButtonColor;
  final EdgeInsetsGeometry? buttonPadding;
  // final EdgeInsets? padding;
  // final Color? fillColor;
  // final Color? textColor;
  // final BorderSide? borderSide;

  const AppButtonWidget({
    Key? key,
    this.style = AppButtonStyle.contained,
    required this.child,
    this.onPressed,
    this.disableButtonColor = false,
    this.buttonPadding,
    // this.padding,
    // this.fillColor,
    // this.textColor,
    // this.borderSide,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (style == AppButtonStyle.outlined) {
      return Container(
        height: 44,
        padding:
            buttonPadding ?? EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        // width: MediaQuery.of(context).size.width * 0.35,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          border: Border(
            top: BorderSide(
              color: Colors.blue,
              width: 2,
            ),
            left: BorderSide(
              color: Colors.blue,
              width: 2,
            ),
            right: BorderSide(
              color: Colors.blue,
              width: 2,
            ),
            bottom: BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
        ),
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          onPressed: onPressed,
          child: child!,
        ),
      );
    }

    if (style == AppButtonStyle.text && child != null) {
      return TextButton(
        onPressed: onPressed,
        child: child!,
      );
    }
    //NOTE: Verifica a versão do botão, se é desabilitado ou habilitado.
    return !disableButtonColor
        //NOTE: A versão habilitado tem a cor normal e retorna uma função.
        ? Container(
            // height: 44,
            padding: buttonPadding ??
                EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            // width: MediaQuery.of(context).size.width * 0.35,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  Color(0xff01D0FA),
                  Color(0xff3698F7),
                  Color(0xff6665F5),
                  Color(0xff8D65F5),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              onPressed: onPressed,
              child: child!,
            ),
          )
        //NOTE: Versão do botão desabilidado, a cor fica desfocada e retorna uma função vazia.
        : Container(
            height: 44,
            // width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  const Color(0xff01D0FA).withOpacity(0.5),
                  const Color(0xff3698F7).withOpacity(0.5),
                  const Color(0xff6665F5).withOpacity(0.5),
                  const Color(0xff8D65F5).withOpacity(0.5),
                ],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(100)),
            ),
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              onPressed: () {},
              child: child!,
            ),
          );
  }
}
