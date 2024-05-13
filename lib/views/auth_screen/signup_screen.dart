import 'package:brainupp/const/const.dart';
import 'package:brainupp/controllers/auth_controller.dart';
import 'package:brainupp/views/home_screen/home.dart';

import 'package:brainupp/widget_common/bg2_widget.dart';
import 'package:brainupp/widget_common/custom_textfield.dart';
import 'package:brainupp/widget_common/our_button.dart';
import 'package:get/get.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  bool? ischeck = false;
  var controller = Get.put(AuthController());

//text controller
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bggWidget(Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(children: [
          (context.screenHeight * 0.1).heightBox,
          50.heightBox,
          "Sign up "
              .text
              .fontFamily(bold)
              .fontWeight(FontWeight.bold)
              .white
              .size(40)
              .make(),
          10.heightBox,
          Obx(
            () => Column(
              children: [
                customtextfield(
                    title: name,
                    hint: namehint,
                    controller: nameController,
                    isPass: false),
                customtextfield(
                    title: email,
                    hint: emailhint,
                    controller: emailController,
                    isPass: false),
                customtextfield(
                    title: password,
                    hint: passwordhint,
                    controller: passwordController,
                    isPass: true),
                customtextfield(
                    title: retypepassword,
                    hint: passwordhint,
                    controller: passwordRetypeController,
                    isPass: true),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetpass.text.make())),
                5.heightBox,
                10.heightBox,
                Row(
                  children: [
                    Checkbox(
                        value: ischeck,
                        checkColor: pallete2,
                        activeColor: whiteColor,
                        onChanged: (newvalue) {
                          setState(() {
                            ischeck = newvalue;
                          });
                        }),
                    10.widthBox,
                    Expanded(
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "I Agree to The ",
                            style: TextStyle(
                                fontFamily: regular, color: fontGrey)),
                        TextSpan(
                            text: termAndCond,
                            style: TextStyle(
                                fontFamily: semibold, color: pallete2)),
                        TextSpan(
                            text: " & ",
                            style: TextStyle(
                                fontFamily: regular, color: fontGrey)),
                        TextSpan(
                            text: privacy,
                            style: TextStyle(
                                fontFamily: semibold, color: pallete2)),
                      ])),
                    ),
                  ],
                ),
                controller.isloading.value
                    ? const CircularProgressIndicator()
                    : ourButton(
                        color: ischeck == true ? pallete2 : lightGold,
                        title: signup,
                        textcolor: lightGold,
                        onPress: () async {
                          if (ischeck != false) {
                            controller.isloading(true);
                            try {
                              await controller
                                  .signupMethod(
                                      context: context,
                                      email: emailController.text,
                                      password: passwordController.text)
                                  .then((value) {
                                return controller.storeuserData(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text);
                              }).then((value) {
                                VxToast.show(context, msg: loggedin);
                                Get.offAll(() => const Home());
                              });
                            } catch (e) {
                              auth.signOut();
                              // ignore: use_build_context_synchronously
                              VxToast.show(context, msg: e.toString());
                              controller.isloading(false);
                            }
                          }
                        },
                      ).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                //wrap with gesture detector
                GestureDetector(
                    child: RichText(
                        text: const TextSpan(children: [
                  TextSpan(
                    text: alreadyAccount,
                    style: TextStyle(fontFamily: bold, color: fontGrey),
                  ),
                  TextSpan(
                    text: login,
                    style: TextStyle(fontFamily: bold, color: pallete2),
                  ),
                ])).onTap(() {
                  Get.back();
                }))
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowSm
                .make(),
          ),
        ]),
      ),
    ));
  }
}
