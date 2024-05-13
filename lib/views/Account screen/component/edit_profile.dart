import 'dart:io';

import 'package:brainupp/const/const.dart';
import 'package:brainupp/controllers/profile_controller.dart';
import 'package:brainupp/widget_common/bg2_widget.dart';
import 'package:brainupp/widget_common/custom_textfield.dart';
import 'package:brainupp/widget_common/our_button.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  final dynamic data;
  const EditProfile({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bggWidget(Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            controller.profileimgPath.isEmpty
                ? Image.asset(
                    ppprofile,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ).box.size(150, 150).roundedFull.clip(Clip.antiAlias).make()
                : Image.file(
                    File(controller.profileimgPath.value),
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.size(70, 70).roundedFull.clip(Clip.antiAlias).make(),
            ourButton(
                color: pallete2,
                onPress: () {
                  controller.changeImage(context);
                },
                textcolor: whiteColor,
                title: "Change"),
            Divider(),
            20.heightBox,
            customtextfield(
                hint: namehint,
                title: name,
                isPass: false,
                controller: controller.namecontroller),
            customtextfield(
                hint: passwordhint,
                title: password,
                isPass: false,
                controller: controller.passcontroller),
            customtextfield(
                hint: emailhint,
                title: email,
                isPass: false,
                controller: controller.emailcontroller),
            10.heightBox,
            controller.isLoading.value
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(pallete2),
                  )
                : SizedBox(
                    width: context.screenWidth - 60,
                    child: ourButton(
                        color: pallete2,
                        onPress: () async {
                          controller.isLoading(true);

                          await controller.uploadprofileImg();
                          await controller.updateProfile(
                            imgUrl: controller.profileImgLink,
                            name: controller.namecontroller.text,
                            password: controller.passcontroller.text,
                            email: controller.emailcontroller,
                          );
                          VxToast.show(context, msg: "Updated");
                        },
                        textcolor: whiteColor,
                        title: "Save"),
                  ),
          ],
        )
            .box
            .white
            .shadowSm
            .rounded
            .padding(const EdgeInsets.all(16))
            .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
            .make(),
      ),
    ));
  }
}
