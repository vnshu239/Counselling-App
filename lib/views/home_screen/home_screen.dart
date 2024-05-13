import 'package:brainupp/const/const.dart';
import 'package:brainupp/const/lists.dart';

import 'package:brainupp/views/homescreen%20elements/stresscale.dart';

import 'package:brainupp/widget_common/bg2_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bggWidget(Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(imgbg4), fit: BoxFit.fill)),
      child: SafeArea(
        child: Column(
          children: [
            10.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Transform.translate(
                        offset:
                            Offset(-110, 0), // Move text 20 pixels to the right
                        child: Center(
                          child: "Start Your"
                              .text
                              .size(40)
                              .align(TextAlign.start)
                              .white
                              .make(),
                        )),
                    Transform.translate(
                        offset: Offset(
                            -80, -10), // Move text 20 pixels to the right
                        child: Center(
                          child: "daily sessions"
                              .text
                              .size(40)
                              .fontWeight(FontWeight.bold)
                              .align(TextAlign.start)
                              .white
                              .fontFamily(bold)
                              .make(),
                        )),
                    VxSwiper.builder(
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: 1,
                        aspectRatio: 16 / 9,
                        itemBuilder: ((context, index) {
                          return Center(
                            child: quote[index]
                                .text
                                .white
                                .bold
                                .size(30)
                                .make()
                                .box
                                .color(pink)
                                .rounded
                                .clip(Clip.antiAlias)
                                .padding(EdgeInsets.all(40))
                                .margin(EdgeInsets.symmetric(horizontal: 15))
                                .make(),
                          );
                        })),
                    Container(
                      color: whiteColor,
                      child: const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                      ),
                    ).box.rounded.make(),
                    10.heightBox,
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 0,
                                mainAxisExtent: 200),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Transform.translate(
                                  offset: const Offset(-0,
                                      -20), // Move text 20 pixels to the right
                                  child: Center(
                                    child: Image.asset(logolist[index],
                                        fit: BoxFit.fitHeight),
                                  )
                                      .box
                                      // .margin(EdgeInsets.all(7))
                                      // .padding(EdgeInsets.all(1))
                                      .make()),
                              Transform.translate(
                                  offset: const Offset(0,
                                      40), // Move text 20 pixels to the right
                                  child: Center(
                                      child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Center(
                                      child: Text(
                                        logname[index],
                                        style: const TextStyle(
                                            fontFamily: bold,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40,
                                            color: whiteColor),
                                      ),
                                    ),
                                  )))
                            ],
                          )
                              .box
                              .color(pallete2.withOpacity(0.8))
                              .margin(const EdgeInsets.symmetric(horizontal: 8))
                              .roundedSM
                              .shadowSm
                              .padding(const EdgeInsets.all(12))
                              .make()
                              .onTap(() {
                            if (index < 7) {
                              Get.to(() => homego[index]);
                            } else {
                              PHQ9Screen();
                            }
                            ;
                          });
                        }),
                    20.heightBox,
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                mainAxisExtent: 100),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Transform.translate(
                                  offset: Offset(-150,
                                      0), // Move text 20 pixels to the right
                                  child: Center(
                                    child: Image.asset(scrollogo[index],
                                        fit: BoxFit.cover),
                                  )
                                      .box
                                      .white
                                      .roundedFull
                                      .margin(EdgeInsets.all(7))
                                      .padding(EdgeInsets.all(1))
                                      .make()),
                              const Spacer(),
                              Transform.translate(
                                  offset: Offset(80,
                                      0), // Move text 20 pixels to the right
                                  child: Center(
                                      child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      scrollist[index],
                                      style: const TextStyle(
                                          fontFamily: bold,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          color: whiteColor),
                                    ),
                                  )))
                            ],
                          )
                              .box
                              .color(pallete2.withOpacity(0.9))
                              .margin(const EdgeInsets.symmetric(horizontal: 8))
                              .roundedSM
                              .shadowSm
                              .padding(const EdgeInsets.all(12))
                              .make()
                              .onTap(() {
                            if (index < 5) {
                              Get.to(() => homelogo2[index]);
                            } else {
                              PHQ9Screen();
                            }
                            ;
                          });
                        }),
                    20.heightBox,
                    10.heightBox,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
