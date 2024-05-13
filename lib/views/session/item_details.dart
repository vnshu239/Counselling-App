import 'package:brainupp/const/colors.dart';
import 'package:brainupp/const/const.dart';
import 'package:brainupp/const/lists.dart';
import 'package:brainupp/widget_common/bg2_widget.dart';

import 'package:brainupp/widget_common/our_button.dart';

import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final int? inde;
  const ItemDetails({super.key, required this.title, required this.inde});

  @override
  Widget build(BuildContext context) {
    return bggWidget(
      Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(
          title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
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
        body: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //swiper section
                    VxSwiper.builder(
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: 1,
                        aspectRatio: 16 / 9,
                        itemBuilder: ((context, index) {
                          return Image.asset(
                            sessionlist[inde!],
                            //,
                            fit: BoxFit.fitWidth,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        })),
                    20.heightBox,

                    //rating
                    // VxRating(
                    //   onRatingUpdate: (value) {},
                    //   normalColor: textfieldGrey,
                    //   selectionColor: golden,
                    //   //maxRating: 5,
                    //   count: 5,
                    //   size: 25,
                    //   stepInt: true,
                    // ),
                    "Description"
                        .text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .size(20)
                        .make(),

                    10.heightBox,
                    line[0]
                        .text
                        .color(pallete2)
                        .fontFamily(bold)
                        .size(15)
                        .make(),
                    line[1]
                        .text
                        .color(pallete2)
                        .fontFamily(bold)
                        .size(15)
                        .make(),
                    line[2]
                        .text
                        .color(pallete2)
                        .fontFamily(bold)
                        .size(15)
                        .make(),
                    line[3]
                        .text
                        .color(pallete2)
                        .fontFamily(bold)
                        .size(15)
                        .make(),
                    line[4]
                        .text
                        .color(pallete2)
                        .fontFamily(bold)
                        .size(15)
                        .make(),
                    line[5]
                        .text
                        .color(pallete2)
                        .fontFamily(bold)
                        .size(15)
                        .make(),
                    line[6]
                        .text
                        .color(pallete2)
                        .fontFamily(bold)
                        .size(15)
                        .make(),
                    line[7]
                        .text
                        .color(pallete2)
                        .fontFamily(bold)
                        .size(15)
                        .make(),
                    line[8]
                        .text
                        .color(pallete2)
                        .fontFamily(bold)
                        .size(15)
                        .make(),
                    line[9]
                        .text
                        .color(pallete2)
                        .fontFamily(bold)
                        .size(15)
                        .make(),

                    10.heightBox,
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Time"
                                .text
                                .white
                                .fontFamily(semibold)
                                .color(Colors.black)
                                .make(),
                            5.heightBox,
                            "12:00pm"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make()
                          ],
                        )),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.timer,
                            color: darkFontGrey,
                          ),
                        ),
                      ],
                    )
                        .box
                        .height(60)
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .color(textfieldGrey)
                        .make(),
                    10.heightBox,
                  ],
                ),
              ),
            )),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ourButton(
                  color: pallete2,
                  onPress: () {},
                  textcolor: whiteColor,
                  title: "Join Session!!"),
            ).box.width(context.screenWidth - 170).make(),
            10.heightBox
          ],
        ),
      ),
    );
  }
}
