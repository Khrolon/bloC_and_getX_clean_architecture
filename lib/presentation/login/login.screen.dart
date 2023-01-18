import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:poc/core/widgets/app_base_text_field.dart';
import 'package:poc/presentation/login/controller/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.04),
              child: Center(
                child: SvgPicture.asset(
                  'assets/svg/logo_mitra_colorido.svg',
                ),
              ),
            ),
            Form(
              child: Column(
                children: [
                  // if (controllerLogin.loading.value)
                  //   const CircularProgressIndicator()
                  // else
                  //   Container(),
                  CustomTextField(
                    labelText: 'E-mail',
                    obscureText: false,
                    controller: controller.emailController,
                    labelTextFontSize: 16,
                    // enabled: controllerServer.getSelectedIsNotEmpty() &&
                    //     controllerLogin.checkTermsOfUser.isTrue,
                  ),
                  CustomTextField(
                    labelText: 'Senha',
                    obscureText: true,
                    controller: controller.passwordController,
                    labelTextFontSize: 16,
                    showPassword: controller.showPassword.isTrue,
                    suffixIconWidget: GestureDetector(
                      onTap: () {
                        controller.togglevisibility();
                      },
                      child: Icon(
                        controller.showPassword.isFalse
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xff7B8098).withOpacity(.79),
                        size: 18,
                      ),
                      // enabled: controllerServer.getSelectedIsNotEmpty() &&
                      //     controllerLogin.checkTermsOfUser.isTrue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.016),
            Obx((() => controller.loading.isTrue
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.forgothPassword();
                        },
                        child: Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.016),
                      Container(
                        height: 60,
                        width: Get.width,
                        decoration: _getLoginDecoration(),
                        child: TextButton(
                          onPressed: () {
                            controller.userLogin();
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          child: Text(
                            'Continue',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.016),
                      Container(
                        // height: 44,
                        // width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
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
                          onPressed: () {
                            controller.googleLogin();
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'http://pngimg.com/uploads/google/google_PNG19635.png',
                                height: 40,
                                width: 40,
                              ),
                              Text(
                                'Entrar com Google',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.016),
                      InkWell(
                        onTap: () {
                          controller.createUser();
                        },
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Ainda não tem uma conta? ',
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            TextSpan(
                              text: 'Crie a sua aqui.',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                          ]),
                        ),
                        // Text(
                        //   'Ainda não tem uma conta?',
                        //   style: TextStyle(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                      ),
                    ],
                  ))),
          ],
        ),
      ),
    );
  }

  Decoration _getLoginDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          Color(0xff01D0FA),
          Color(0xff3698F7),
          Color(0xff6665F5),
          Color(0xff8D65F5),

          //NOTE: Cor que correspondeu:
          // Color(0xff3698F7).withOpacity(0.8),
          // Color(0xff6665F5).withOpacity(0.8),
        ],
      ),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );

    //backup desabilitando os botões.;
    // return true
    //     // controller.checkTermsOfUser.isTrue
    //     //NOTE: Cor do botão de login caso os termos estiverem aceitos.
    //     ? const BoxDecoration(
    //         gradient: LinearGradient(
    //           begin: Alignment.bottomRight,
    //           end: Alignment.topLeft,
    //           colors: [
    //             Color(0xff01D0FA),
    //             Color(0xff3698F7),
    //             Color(0xff6665F5),
    //             Color(0xff8D65F5),

    //             //NOTE: Cor que correspondeu:
    //             // Color(0xff3698F7).withOpacity(0.8),
    //             // Color(0xff6665F5).withOpacity(0.8),
    //           ],
    //         ),
    //         borderRadius: BorderRadius.all(Radius.circular(8)),
    //       )
    //     //NOTE: Cor do botão de login caso os termos recusados.
    //     : BoxDecoration(
    //         gradient: LinearGradient(
    //           begin: Alignment.bottomRight,
    //           end: Alignment.topLeft,
    //           colors: [
    //             const Color(0xff01D0FA).withOpacity(0.5),
    //             const Color(0xff3698F7).withOpacity(0.5),
    //             const Color(0xff6665F5).withOpacity(0.5),
    //             const Color(0xff8D65F5).withOpacity(0.5),
    //             //NOTE: Cor que correspondeu:
    //             // Color(0xff3698F7).withOpacity(0.8),
    //             // Color(0xff6665F5).withOpacity(0.8),
    //           ],
    //         ),
    //         borderRadius: const BorderRadius.all(
    //           Radius.circular(100),
    //         ),
    //       );
  }
}
