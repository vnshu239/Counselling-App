import 'package:brainupp/const/const.dart';
import 'package:brainupp/const/lists.dart';
import 'package:brainupp/controllers/auth_controller.dart';
import 'package:brainupp/views/auth_screen/signup_screen.dart';
import 'package:brainupp/views/home_screen/home.dart';
import 'package:brainupp/widget_common/bg2_widget.dart';
import 'package:brainupp/widget_common/custom_textfield.dart';
import 'package:brainupp/widget_common/our_button.dart';
import 'package:get/get.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bggWidget(Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(children: [
          (context.screenHeight * 0.1).heightBox,
          //applogoWidget(),
          100.heightBox,
          "Login".text.fontFamily(bold).white.size(40).make(),
          10.heightBox,
          Obx(
            () => Column(
              children: [
                customtextfield(
                    title: email,
                    hint: emailhint,
                    isPass: false,
                    controller: controller.emailcontroller),
                customtextfield(
                    title: password,
                    hint: passwordhint,
                    isPass: true,
                    controller: controller.passwordcontroller),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetpass.text.make())),
                5.heightBox,
                controller.isloading.value
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(pallete2),
                      )
                    : ourButton(
                        color: pallete2,
                        title: login,
                        textcolor: whiteColor,
                        onPress: () async {
                          controller.isloading(true);

                          await controller
                              .loginMethod(context: context)
                              .then((value) {
                            if (value != null) {
                              VxToast.show(context, msg: loggedin);
                              Get.offAll(() => const Home());
                            } else {
                              controller.isloading(false);
                            }
                          });
                        }).box.width(context.screenWidth - 250).make(),
                5.heightBox,
                createNewAcc.text.color(fontGrey).make(),
                5.heightBox,
                ourButton(
                    color: lightGold,
                    title: signup,
                    textcolor: pallete2,
                    onPress: () {
                      Get.to(() => const Signupscreen());
                    }).box.width(context.screenWidth - 250).make(),
                10.heightBox,
                loginwith.text.color(fontGrey).make(),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.asset(
                                SocialIconlist[index],
                                width: 30,
                              ),
                            ),
                          )),
                )
              ],
            )
                .box
                .white
                .rounded
                .padding(EdgeInsets.all(16))
                .width(context.screenWidth - 90)
                .shadowSm
                .make(),
          ),
        ]),
      ),
    ));
  }
}
