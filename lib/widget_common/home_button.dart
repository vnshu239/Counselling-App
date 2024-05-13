import 'package:brainupp/const/const.dart';

Widget homebutton({width, height, icon, String? title, onpress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        width: 26,
      ),
      10.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  ).box.rounded.size(width, height).shadowSm.white.make();
}
