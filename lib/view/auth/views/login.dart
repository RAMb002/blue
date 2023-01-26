import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rackathon/controller/auth_controller.dart';
import 'package:rackathon/res/dimensions.dart';
import 'package:rackathon/view/auth/views/reset_password.dart';
import 'package:rackathon/view/auth/widgets/bottom_circle.dart';
import 'package:rackathon/view/auth/widgets/middle_circle.dart';
import 'package:rackathon/view/auth/widgets/button.dart';
import 'package:rackathon/view/auth/widgets/textformfield.dart';
import 'package:rackathon/view/auth/widgets/top_circle.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController controller = AuthController();

  @override
  void initState() {
    super.initState();
    getLocationPermission();
  }

  getLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
  }

  @override
  void dispose() {
    userIdController.dispose();
    passwordController.dispose();
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
              // bottom: 0,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 490,
                        width: width,
                        child: Card(
                          elevation: 10,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          margin: const EdgeInsets.only(
                              top: 50, left: 20, right: 20, bottom: 0),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 180,
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
                                      hintText: "Enter your password",
                                      textEditingController: passwordController,
                                      icon: Icons.key_outlined,
                                      isPassword: true,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CupertinoButton(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: const Text(
                                          "Forgot Password",
                                          style: TextStyle(
                                              color: kLogoColor,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 14),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ResetPasswordView()));
                                        }),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Button(
                                          onPressed: () =>
                                              controller.loginOnPressed(
                                                  context,
                                                  userIdController.text,
                                                  passwordController.text),
                                          text: "Login",
                                        ))
                                  ]),
                            ),
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
                                width: 250,
                                "assets/images/logo.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15),
                    child: SizedBox(
                      width: width - 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.network(
                              height: 60,
                              width: 60,
                              "https://www.bluetooth.com/wp-content/uploads/2019/04/Bluetooth_FM_Color.png"),
                          Image.network(
                              height: 70,
                              width: 70,
                              "https://s3-alpha-sig.figma.com/img/f8d5/9003/80fa8da2af5eaeddf60c076eb83057e3?Expires=1675641600&Signature=fYXVr1XjdFJnBj~FodosRE9MQNksJTvw-iCkJHDgu9r3RL5J3UCUS2i6DXc6mmloHC-~~BPBKXccH3pFIQdiU0KfntAP63-C9FWmiNKwHNeA9GJ15SOJsi2R4kuhFgvzddWzi-E3yCAJvG4Lqb-pwLA-FESNGxhUjck0TU6fKRww3LhT5lQ9fGMbSpzKJTwS1OFr~9JXsIbAjwJc5sicWdFub~-jBgZsXKXWzwEbEYmWqJVfhOFE6oCdYPFBrIxdWjZ8iaInDy3r777SbLSSdCJxcv5seYJVSlha7IPHv6laQZXltGxfKpB5iwqYvoizX-SEVSDJHUwcgBjAXXbakw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                          Image.network(
                              height: 70,
                              width: 70,
                              "https://s3-alpha-sig.figma.com/img/e2f3/cd5a/25138397567b1293a9be153f0297e3aa?Expires=1675641600&Signature=oslka6ikqNWa1-NDNv~Gqv2XTH8Ewqv4T-13jLlN79J1mV5716uUm9ELH9kBXasttCH8WMlW-dhdwfUoSkr1ytTDcmPd72mS6GXpQrw8KuSqBRhk8xJ-ZDH13~T70Ulyy83O3jDPsTrrK-qP3fUbzCopv8jvCJF3MZjQMBh~SZF-cfmRRg0vu3qm9u6WlXNiY-mq0RgiNuvgFzCjL8t0ZAMDCclTtwmX0CGoGC36DNAoTHeDSWlpGVSib891Hs7czbSRvfxwTuEc63gHnAx479~99sf0N5aMtF0KaFy7lhRXK2hUy5fZz7b9Ibrcr4wIBoCP2AVJyu84r1WIcXSHXQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
