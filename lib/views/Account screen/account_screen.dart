import 'package:brainupp/const/const.dart';
import 'package:brainupp/controllers/auth_controller.dart';
import 'package:brainupp/controllers/profile_controller.dart';
import 'package:brainupp/services/firestore_services.dart';
import 'package:brainupp/views/Account%20screen/component/edit_profile.dart';
import 'package:brainupp/views/auth_screen/login_screen.dart';

import 'package:brainupp/widget_common/bg4_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bg4_Widget(Scaffold(
        body: StreamBuilder(
            stream: FirestoreServices.getUser(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(pallete2),
                  ),
                );
              } else {
                var data = snapshot.data!.docs[0];
                return SafeArea(
                    child: Column(
                  children: [
                    //edit profile button
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: const Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.edit,
                            color: whiteColor,
                          )).onTap(() {
                        controller.namecontroller.text = data['name'];
                        controller.passcontroller.text = data['password'];
                        Get.to(() => EditProfile(
                              data: data,
                            ));
                      }),
                    ),

                    //             //user detail section

                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Stack(
                        children: [
                          Transform.translate(
                              offset: Offset(
                                  -1, 5), // Move text 20 pixels to the right
                              child: Center(
                                  child: Image.asset(
                                ppprofile,
                                width: 100,
                                fit: BoxFit.cover,
                              )
                                      .box
                                      .size(325, 325)
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make())),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Transform.translate(
                                  offset: Offset(-80,
                                      320), // Move text 20 pixels to the right
                                  child: Center(
                                      child: "${data['name']}"
                                          .text
                                          .color(Colors.black)
                                          .size(25)
                                          .fontFamily(semibold)
                                          .make())),
                              5.heightBox,
                              Transform.translate(
                                  offset: const Offset(-45,
                                      350), // Move text 20 pixels to the right
                                  child: Center(
                                      child: "${data['email']}"
                                          .text
                                          .size(25)
                                          .color(Colors.black)
                                          .make())),
                            ],
                          )),
                        ],
                      ),
                    ),

                    Transform.translate(
                            offset: Offset(
                                -150, -25), // Move text 20 pixels to the right
                            child: Center(child: Image.asset(user)))
                        .box
                        .size(50, 70)
                        .make(),
                    Transform.translate(
                            offset: Offset(
                                -150, -30), // Move text 20 pixels to the right
                            child: Center(child: Image.asset(mail)))
                        .box
                        .size(40, 60)
                        .make(),
                    Column(
                      children: [
                        0.heightBox,
                        425.widthBox,
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.black)),
                            onPressed: () async {
                              await Get.put(AuthController())
                                  .signoutMethod(context);
                              Get.offAll(() => const Loginscreen());
                            },
                            child: logout.text
                                .fontFamily(semibold)
                                .color(Colors.black)
                                .make())
                      ],
                    )
                  ],
                ));
              }
            })));
  }
}
