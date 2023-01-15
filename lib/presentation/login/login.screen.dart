import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/core/widgets/app_base_text_field.dart';
import 'package:poc/presentation/login/bloc/login_bloc.dart';
import 'package:poc/presentation/login/bloc/login_state.dart';

import 'bloc/login_event.dart';

class LoginScreen extends StatelessWidget {
  final LoginBloc bloc;
  const LoginScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return BlocListener(
      bloc: bloc,
      listener: (context, state) {
        if (state is LoginCompleteGoToSecondPage) {
          Navigator.pushNamed(
            context,
            '/home',
            arguments: {'userModel': state.userModel},
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: maxHeight * 0.04),
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
                      controller: bloc.emailController,
                      labelTextFontSize: 16,
                      // enabled: controllerServer.getSelectedIsNotEmpty() &&
                      //     controllerLogin.checkTermsOfUser.isTrue,
                    ),
                    CustomTextField(
                      labelText: 'Senha',
                      obscureText: true,
                      controller: bloc.passwordController,
                      labelTextFontSize: 16,
                      // enabled: controllerServer.getSelectedIsNotEmpty() &&
                      //     controllerLogin.checkTermsOfUser.isTrue,
                    ),
                  ],
                ),
              ),
              SizedBox(height: maxHeight * 0.016),
              InkWell(
                onTap: () {
                  bloc.add(LoginEventForgothPassword());
                },
                child: Text(
                  'Esqueceu a senha?',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: maxHeight * 0.016),
              BlocBuilder<LoginBloc, LoginState>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is LoginStateLoading) {
                      return const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is LoginStateError) {}
                    return Container(
                      height: 60,
                      width: maxWidth,
                      decoration: _getLoginDecoration(),
                      child: TextButton(
                        onPressed: () {
                          bloc.add(
                            LoginEventGetToken(
                                email: bloc.emailController.text,
                                password: bloc.passwordController.text),
                          );
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
                    );
                  }),
              SizedBox(height: maxHeight * 0.016),
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
                    bloc.add(LoginEventGoogleLogin());
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
              SizedBox(height: maxHeight * 0.016),
              InkWell(
                onTap: () {
                  bloc.add(LoginEventCreateUser());
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
          ),
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
