import 'package:brainupp/const/const.dart';
import 'package:brainupp/const/lists.dart';

import 'package:brainupp/views/session/item_details.dart';
import 'package:brainupp/widget_common/bg2_widget.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bggWidget(Scaffold(
      appBar: AppBar(
        title: "Sessions".text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
            itemCount: 3,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: 200,
                mainAxisSpacing: 28,
                crossAxisSpacing: 8),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Image.asset(
                    sessionlist[index],
                    height: 190,
                    fit: BoxFit.fill,
                    width: 1030,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Mentor',
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 16.0, // Text size
                          fontWeight: FontWeight.bold, // Text weight
                        ),
                      )
                          .box
                          .color(pink)
                          .padding(EdgeInsets.all(8))
                          .rounded
                          .make(),
                    ),
                  ),
                  Transform.translate(
                    offset:
                        Offset(-110, -75), // Move text 20 pixels to the right
                    child: Center(
                      child: Text(
                        ratelist[index],
                        style: TextStyle(color: Colors.black, fontFamily: bold),
                      )
                          .box
                          .color(Colors.yellow)
                          .roundedSM
                          .padding(EdgeInsets.all(2))
                          .make(),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-90, 0), // Move text 20 pixels to the right
                    child: Center(
                      child: Text(
                        namelist[index],
                        style: const TextStyle(
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset:
                                    Offset(0, -5), // Adjust the vertical offset
                              ),
                            ],
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: 1,
                            decorationStyle: TextDecorationStyle.solid,
                            fontFamily: bold,
                            fontSize: 36),
                      )
                          .box
                          .padding(EdgeInsets.all(2))

                          // .color(Colors.yellow)
                          .roundedSM
                          .make(),
                    ),
                  ),
                ],
              )
                  .box
                  .white
                  .rounded
                  .clip(Clip.antiAlias)
                  .outerShadowSm
                  .make()
                  .onTap(() {
                Get.to(() => ItemDetails(
                      title: "Help Session!!",
                      inde: index,
                    ));
              });
            }),
      ),
    ));
  }
}
