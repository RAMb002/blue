import 'package:flutter/material.dart';
import 'package:rackathon/controller/auth_controller.dart';
import 'package:rackathon/view/auth/widgets/bottom_circle.dart';
import 'package:rackathon/view/auth/widgets/middle_circle.dart';
import 'package:rackathon/view/auth/widgets/button.dart';
import 'package:rackathon/view/auth/widgets/textformfield.dart';
import 'package:rackathon/view/auth/widgets/top_circle.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextEditingController userIdController = TextEditingController();
  TextEditingController resetPasswordController = TextEditingController();
  final AuthController controller = AuthController();

    @override
  void dispose() {
    userIdController.dispose();
    resetPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            color: Colors.white,
          ),
          TopCircle(width: width),
          MiddleCircle(width: width),
          BottomCicle(width: width),
          Positioned(
              top: 50,
              child: Stack(
                        alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 510,
                    width: width,
                    child: Card(
                      elevation: 10,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      margin: const EdgeInsets.only(
                          top: 50, left: 20, right: 20, bottom: 70),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 170,
                              ),
                              MyTextFormField(
                                  hintText: "User ID",
                                  textEditingController: userIdController,
                                  icon: Icons.mail_outline,
                                  isPassword: false,
                                  ),
                              const SizedBox(
                                height: 20,
                              ),
                              MyTextFormField(
                                hintText: "Enter your new password",
                                textEditingController: resetPasswordController,
                                icon: Icons.key_outlined,
                                isPassword: true,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Button(
                                  text: "Reset password",
                                  onPressed: ()=> controller.resetOnPressed(context, userIdController.text, resetPasswordController.text)
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                  Positioned(
                        top: 20,
                        child: IgnorePointer(
                          child: Hero(
                            tag: 'image',
                            child: Image.asset(
                                                  height: 250,
                                                  width : 250,
                                                  "assets/images/logo.png"),
                          ),
                        ),
                      ),
                ],
              ))
        ],
      ),
    );
  }
}


