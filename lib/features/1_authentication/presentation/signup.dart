import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nbl/core/themes/text_styles.dart';
import 'package:nbl/core/util/responsive.dart';
import 'package:nbl/core/util/widgets/custom_button.dart';
import 'package:nbl/core/util/widgets/social_icon.dart';
import 'package:nbl/core/util/widgets/text_field.dart';
import 'package:nbl/features/1_authentication/controllers/signup_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive res = Responsive(context: context);
    TextStyles styles = TextStyles(res: res);
    SignUpController controller = Get.put(SignUpController());

    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: res.smallWidget(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Create a new account",
                  style: styles.headline2,
                ),
                const SizedBox(height: 25),
                Form(
                  key: controller.key,
                  child: Column(
                    children: [
                      NormalTextField(
                        controller: controller.firstName,
                        function: () {},
                        validate: controller.validateField,
                        textStyle: styles.bodyText1,
                        hintText: '',
                        labelText: 'First Name',
                      ),
                      const SizedBox(height: 10),
                      NormalTextField(
                        controller: controller.lastName,
                        function: () {},
                        validate: controller.validateField,
                        textStyle: styles.bodyText1,
                        hintText: '',
                        labelText: 'Last Name',
                      ),
                      const SizedBox(height: 10),
                      NormalTextField(
                        controller: controller.email,
                        function: () {},
                        validate: controller.validateEmail,
                        textStyle: styles.bodyText1,
                        hintText: 'jondoe@example.com',
                        labelText: 'Email',
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => PasswordTextField(
                          controller: controller.password,
                          function: () => controller.changeVisibility(),
                          textStyle: styles.bodyText1,
                          validate: controller.validatePassword,
                          hintText: '',
                          labelText: 'Password',
                          isPassword: controller.isVisible.value,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => PasswordTextField(
                          controller: controller.confirmPassword,
                          function: () => controller.changeVisibility2(),
                          textStyle: styles.bodyText1,
                          validate: controller.validateConfirm,
                          hintText: '',
                          labelText: 'Confirm Password',
                          isPassword: controller.isVisible2.value,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'Sign Up',
                        onPressed: () {
                          if (controller.key.currentState!.validate()) {
                            controller.signUp(
                              context,
                              controller.firstName.text.trim(),
                              controller.lastName.text.trim(),
                              controller.email.text.trim(),
                              controller.password.text.trim(),
                            );
                          }
                        },
                        textStyle: styles.button,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '-Or Sign Up with-',
                        style: styles.bodyText2,
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialIconButton(
                            icon: FontAwesomeIcons.google,
                            iconColor: Colors.green,
                            onPressed: () {
                              // Handle Google login
                            },
                          ),
                          const SizedBox(width: 15),
                          SocialIconButton(
                            icon: FontAwesomeIcons.facebook,
                            iconColor: const Color.fromARGB(255, 31, 1, 163),
                            onPressed: () {
                              // Handle Facebook login
                            },
                          ),
                          const SizedBox(width: 15),
                          SocialIconButton(
                            icon: FontAwesomeIcons.twitter,
                            iconColor: Colors.blue, // Assuming this for Twitter
                            onPressed: () {
                              // Handle Twitter login
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already Registered?",
                            style: styles.bodyText2,
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
