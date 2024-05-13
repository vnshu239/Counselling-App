import 'package:brainupp/const/colors.dart';
import 'package:brainupp/const/const.dart';
import 'package:brainupp/const/lists.dart';
import 'package:brainupp/widget_common/bg2_widget.dart';

import 'package:flutter/material.dart';

class musicscreen extends StatelessWidget {
  final String? title;
  const musicscreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bggWidget(
      Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(
          title: "Music ".text.color(pallete2).fontFamily(bold).make(),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                )),
          ],
        ),
        body: bggWidget(
          Column(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.heightBox,
                      "Music: "
                          .text
                          .white
                          .size(50)
                          .color(whiteColor)
                          .fontFamily(semibold)
                          .make(),
                      10.heightBox,
                      GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 8,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 1,
                                  crossAxisSpacing: 0,
                                  mainAxisExtent: 32),
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Transform.translate(
                                    offset: Offset(-0,
                                        0), // Move text 20 pixels to the right
                                    child: Center(
                                      child: musicsec[index]
                                          .text
                                          .size(40)
                                          .color(whiteColor)
                                          .make()
                                          .box
                                          .size(300, 50)
                                          .color(pink.withOpacity(0.6))
                                          .alignTopLeft

                                          //.clip(Clip.antiAlias)
                                          //.padding(EdgeInsets.all(10))
                                          // .margin(EdgeInsets.symmetric(
                                          //   horizontal: 15))
                                          .make(),
                                    )),
                                const Spacer(),
                              ],
                            );
                          }),
                      10.heightBox,

                      // Row(
                      // children: [
                      //   Expanded(
                      //       child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       "seller".text.white.fontFamily(semibold).make(),
                      //       5.heightBox,
                      //       "In house Brands"
                      //           .text
                      //           .fontFamily(semibold)
                      //           .color(darkFontGrey)
                      //           .make()
                      //     ],
                      //   )),
                      //     const CircleAvatar(
                      //       backgroundColor: Colors.white,
                      //       child: Icon(
                      //         Icons.message_rounded,
                      //         color: darkFontGrey,
                      //       ),
                      //     ),
                      //   ],
                      // )
                      //     .box
                      //     .height(60)
                      //     .padding(const EdgeInsets.symmetric(horizontal: 16))
                      //     .color(textfieldGrey)
                      //     .make(),
                      // 10.heightBox,
                      // "Description"
                      //     .text
                      //     .color(darkFontGrey)
                      //     .fontFamily(semibold)
                      //     .make(),
                      // 10.heightBox,
                      // "This is a Dummy item and dummy description is here... "
                      //     .text
                      //     .color(textfieldGrey)
                      //     .make(),
                      // 10.heightBox,
                      // "Product you may also like ".text.make()
                    ],
                  ),
                ),
              )),
              // SizedBox(
              //   width: double.infinity,
              //   height: 60,
              //   child: ourButton(
              //       color: pallete2,
              //       onPress: () {},
              //       textcolor: whiteColor,
              //       title: "Join Session!!"),
              // ).box.width(context.screenWidth - 170).make(),
              10.heightBox
            ],
          ),
        ),
      ),
    );
  }
}
